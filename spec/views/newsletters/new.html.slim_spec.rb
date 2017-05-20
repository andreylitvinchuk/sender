require 'rails_helper'

RSpec.describe "newsletters/new", type: :view do
  before(:each) do
    assign(:newsletter, Newsletter.new(
      :text => "MyText",
      :filters => ""
    ))
  end

  it "renders new newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletters_path, "post" do

      assert_select "textarea#newsletter_text[name=?]", "newsletter[text]"

      assert_select "input#newsletter_filters[name=?]", "newsletter[filters]"
    end
  end
end
