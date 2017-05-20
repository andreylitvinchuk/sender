require 'rails_helper'

RSpec.describe "game_users/edit", type: :view do
  before(:each) do
    @game_user = assign(:game_user, GameUser.create!(
      :name => "MyString",
      :vk_id => "MyString",
      :level => 1,
      :paid => false
    ))
  end

  it "renders the edit game_user form" do
    render

    assert_select "form[action=?][method=?]", game_user_path(@game_user), "post" do

      assert_select "input#game_user_name[name=?]", "game_user[name]"

      assert_select "input#game_user_vk_id[name=?]", "game_user[vk_id]"

      assert_select "input#game_user_level[name=?]", "game_user[level]"

      assert_select "input#game_user_paid[name=?]", "game_user[paid]"
    end
  end
end
