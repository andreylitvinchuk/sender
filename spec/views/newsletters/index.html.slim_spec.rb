require 'rails_helper'

RSpec.describe "newsletters/index", type: :view do
  before(:each) do
    assign(:newsletters, [
      Newsletter.create!(
        :text => "MyText",
        :filters => ""
      ),
      Newsletter.create!(
        :text => "MyText",
        :filters => ""
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
