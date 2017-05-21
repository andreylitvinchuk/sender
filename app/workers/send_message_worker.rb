class SendMessageWorker
  include Sidekiq::Worker

  def perform(recepient_id)
    # Do something
  end
end
