require 'rails_helper'

RSpec.describe "converters/new", type: :view do
  before(:each) do
    assign(:converter, Converter.new())
  end

  it "renders new converter form" do
    render

    assert_select "form[action=?][method=?]", converters_path, "post" do
    end
  end
end
