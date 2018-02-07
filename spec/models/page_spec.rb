require "rails_helper"

describe Page do
  subject { build(:page) }

  it { expect(subject).to be_valid }
  it { expect(subject).to respond_to(:url)}

  context "test success validation" do
    let(:page) { build(:page) }
    it { expect {
          page.save
        }.to change(Page, :count).by(1)
      }
  end

  context "test NIL URL validation" do
    let(:page) { build(:page, url: nil) }

    it { expect {
          page.save
        }.to change(Page, :count).by(0)
      }
  end

  context "test BAD URL validation" do
    let(:page) { build(:page, url: 'xyz') }

    it { expect {
          page.save
        }.to change(Page, :count).by(0)
      }
  end
end
