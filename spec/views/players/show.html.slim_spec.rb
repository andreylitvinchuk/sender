require 'rails_helper'

RSpec.describe "players/show", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :name => "Name",
      :vk_id => "Vk",
      :level => 2,
      :paid => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Vk/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
