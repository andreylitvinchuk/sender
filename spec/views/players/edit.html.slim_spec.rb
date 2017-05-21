require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      :name => "MyString",
      :vk_id => "MyString",
      :level => 1,
      :paid => false
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "input#player_name[name=?]", "player[name]"

      assert_select "input#player_vk_id[name=?]", "player[vk_id]"

      assert_select "input#player_level[name=?]", "player[level]"

      assert_select "input#player_paid[name=?]", "player[paid]"
    end
  end
end
