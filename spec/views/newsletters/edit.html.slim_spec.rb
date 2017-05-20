require 'rails_helper'

RSpec.describe "newsletters/edit", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :text => "MyText",
      :filters => ""
    ))
  end

  it "renders the edit newsletter form" do
    render

    assert_select "form[action=?][method=?]", newsletter_path(@newsletter), "post" do

      assert_select "textarea#newsletter_text[name=?]", "newsletter[text]"

      assert_select "input#newsletter_filters[name=?]", "newsletter[filters]"
    end
  end
end
