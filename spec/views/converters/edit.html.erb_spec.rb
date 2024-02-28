require 'rails_helper'

RSpec.describe "converters/edit", type: :view do
  let(:converter) {
    Converter.create!()
  }

  before(:each) do
    assign(:converter, converter)
  end

  it "renders the edit converter form" do
    render

    assert_select "form[action=?][method=?]", converter_path(converter), "post" do
    end
  end
end
