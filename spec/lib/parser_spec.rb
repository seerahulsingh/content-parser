require 'rails_helper'

describe Parser do
  let(:page) { build(:page) }

  it "successfully parse a given URL" do
    parser = Parser.new(page.url)
    allow(parser).to receive(:get_contents).and_return(:non_nil_value)
    expect(parser.get_contents).to eq(:non_nil_value)
  end
end
