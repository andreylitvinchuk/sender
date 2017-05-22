class SendMessage
  include Interactor::Organizer

  class SendMessageInteractor
    include Interactor

    def call
      context.fail!(message: 'recipient can\'t be blank') if context[:recipient].blank?
      recipient = context[:recipient]
      #todo realize send message
      sleep(5.seconds)
      if rand(2).even?
        recipient.update_attributes(sent: true, error: false)
      else
        recipient.update_attribute(:error, true)
        context.fail!(message: 'sent failed')
      end

    end
  end

  organize SendMessageInteractor
  # organize Interactor1, Interactor2
end
