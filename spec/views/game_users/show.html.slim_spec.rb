require 'rails_helper'

RSpec.describe "game_users/show", type: :view do
  before(:each) do
    @game_user = assign(:game_user, GameUser.create!(
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
