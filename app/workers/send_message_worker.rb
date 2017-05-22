class SendMessageWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'default'

  def perform(recipient_id)
    recipient = Recipient.find(recipient_id)
    res = SendMessage.call(recipient: recipient)
    raise 'sent error' unless res.success?
  end
end
