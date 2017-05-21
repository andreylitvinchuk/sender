# require 'ransack'
class StartNewsletterWorker
  include Sidekiq::Worker

  def perform(newsletter_id)
    @newsletter = Newsletter.find(newsletter_id)
    @players = Player.ransack(@newsletter.ransack_query).result
    @players.each do |player|
      recepient = @newsletter.recipients.create({player: player})
      SendMessageWorker.perform_async(recepient.id)
    end
    # @newsletter.save
  end
end
