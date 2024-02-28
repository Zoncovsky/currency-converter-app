require 'rails_helper'

RSpec.describe "converters/show", type: :view do
  before(:each) do
    assign(:converter, Converter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
