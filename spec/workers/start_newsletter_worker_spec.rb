require 'rails_helper'
RSpec.describe StartNewsletterWorker, type: :worker do

  before(:all) do
    1000.times do
      FactoryGirl.create(:player)
    end

    @newsletter = FactoryGirl.create(:newsletter)
    # byebug
    worker = StartNewsletterWorker.new()
    worker.perform(@newsletter.id)
  end

  let(:newsletter) { @newsletter }

  it 'fill newsletter recipients' do
    expect(newsletter.recipients.count).to be > 0
  end


end
