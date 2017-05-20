require 'rails_helper'

RSpec.describe "game_users/index", type: :view do
  before(:each) do
    assign(:game_users, [
      GameUser.create!(
        :name => "Name",
        :vk_id => "Vk",
        :level => 2,
        :paid => false
      ),
      GameUser.create!(
        :name => "Name",
        :vk_id => "Vk",
        :level => 2,
        :paid => false
      )
    ])
  end

  it "renders a list of game_users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Vk".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
