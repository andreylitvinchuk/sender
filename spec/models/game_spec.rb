require 'rails_helper'

RSpec.describe Game, type: :model do

  subject { FactoryGirl.build(:game) }

  it 'is valid' do
    expect(subject).to be_valid
  end

  it 'is not valid with blank name' do
    subject.name = ''
    expect(subject).not_to be_valid
  end

  it 'is not valid with blank access_token' do
    subject.access_token = ''
    expect(subject).not_to be_valid
  end




end
