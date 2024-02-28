require 'rails_helper'

RSpec.describe "converters/index", type: :view do
  before(:each) do
    assign(:converters, [
      Converter.create!(),
      Converter.create!()
    ])
  end

  it "renders a list of converters" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
