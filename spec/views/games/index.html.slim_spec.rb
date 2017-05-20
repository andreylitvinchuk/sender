require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    assign(:games, [
      Game.create!(
        :name => "Name",
        :access_token => "Access Token"
      ),
      Game.create!(
        :name => "Name",
        :access_token => "Access Token"
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Access Token".to_s, :count => 2
  end
end
