require 'rails_helper'

RSpec.describe "newsletters/show", type: :view do
  before(:each) do
    @newsletter = assign(:newsletter, Newsletter.create!(
      :text => "MyText",
      :filters => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
