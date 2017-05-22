class StartNewsletterWorker
  include Sidekiq::Worker
  # sidekiq_options queue: 'default', :backtrace => true

  def perform(newsletter_id)
    logger.info "StartNewsletterWorker are happening."
    @newsletter = Newsletter.find(newsletter_id)
    @players = Player.ransack(@newsletter.ransack_query).result

    ActiveRecord::Base.transaction do
      @newsletter.recipients.destroy_all
      @players.each do |player|
        recipient = @newsletter.recipients.create({player: player})
      end
    end
    @newsletter.recipients.each do |recipient|
      SendMessageWorker.perform_async(recipient.id)
    end
    # @newsletter.save
  end
end
