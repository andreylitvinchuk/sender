require 'rails_helper'

RSpec.describe Newsletter, type: :model do

  subject { FactoryGirl.create(:newsletter)}

  it 'responds to :text' do
    expect(subject).to respond_to(:text)
  end

  it 'responds to :filters' do
    expect(subject).to respond_to(:filters)
  end

  it 'responds to :recipients' do
    expect(subject).to respond_to(:recipients)
  end


  describe '.ransack_query' do
    it 'responds' do
      expect(subject).to respond_to(:ransack_query)
    end

    it 'returns hash' do
      expect(subject.ransack_query.class).to eq Hash
    end

    it 'return hash for ransack' do
      subject.filters = [
        { prop_name: 'level', logic: 'gteq', value: '10'},
        { prop_name: 'level', logic: 'lteq', value: '12'}
      ]
      expect(subject.ransack_query).to eq({ level_gteq: '10', level_lteq: '12' })
    end



  end



end
