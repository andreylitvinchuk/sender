require 'rails_helper'

RSpec.describe Recipient, type: :model do
  subject{ FactoryGirl.create(:recipient) }

  it '.error' do
    expect(subject).to respond_to :error
  end

  it '.success' do
    expect(subject).to respond_to :sent
  end
end
