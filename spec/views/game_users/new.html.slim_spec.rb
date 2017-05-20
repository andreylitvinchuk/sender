require 'rails_helper'

RSpec.describe "game_users/new", type: :view do
  before(:each) do
    assign(:game_user, GameUser.new(
      :name => "MyString",
      :vk_id => "MyString",
      :level => 1,
      :paid => false
    ))
  end

  it "renders new game_user form" do
    render

    assert_select "form[action=?][method=?]", game_users_path, "post" do

      assert_select "input#game_user_name[name=?]", "game_user[name]"

      assert_select "input#game_user_vk_id[name=?]", "game_user[vk_id]"

      assert_select "input#game_user_level[name=?]", "game_user[level]"

      assert_select "input#game_user_paid[name=?]", "game_user[paid]"
    end
  end
end
