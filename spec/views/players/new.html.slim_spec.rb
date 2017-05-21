require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      :name => "MyString",
      :vk_id => "MyString",
      :level => 1,
      :paid => false
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_vk_id[name=?]", "player[vk_id]"

      assert_select "input#player_level[name=?]", "player[level]"

      assert_select "input#player_paid[name=?]", "player[paid]"
    end
  end
end
