require 'rails_helper'

RSpec.describe SendMessage, type: :interactor do
  describe '.call' do
    before(:all) do
      @recipient = FactoryGirl.create(:recipient)
    end



    describe 'when recipient is not set' do
      subject { SendMessage.call({}) }

      it 'interactor not success' do
        expect(subject.success?).to eq false
      end

      it 'interactor return error' do
        expect(subject.message).to match 'recipient can\'t be blank'
      end
    end

    # subject { SendMessage.call(recipient: @recipient) }

    # it 'set recipient sent' do
    #   expect(subject.recipient.sent).to eq true
    # end

  end
end
