require 'rails_helper'

RSpec.describe Player, type: :model do

  describe 'self.prop_names' do
    subject { Player }
    it 'exist' do
      expect(subject).to respond_to(:prop_names)
    end
    it "shouldn't contain :id" do
      expect(subject.prop_names).not_to include('id')
    end
    it "shouldn't contain :updated_at" do
      expect(subject.prop_names).not_to include('updated_at')
    end
    it "shouldn't contain :created_at" do
      expect(subject.prop_names).not_to include('updated_at')
    end
    it 'is array' do
      expect(subject.prop_names.class).to eq Array
    end
  end




end
