require "rails_helper"

describe Content do
  let(:page) { create(:page) }
  subject { build(:content, page: page) }

  it { expect(subject).to be_valid }
  it { expect(subject).to respond_to(:tag)}
  it { expect(subject).to respond_to(:text)}
  it { expect(subject).to respond_to(:page_id)}
  it { expect(subject).to respond_to(:page)}

  context "test success validation" do
    it { expect {
          subject.save
        }.to change(Content, :count).by(1)
      }
  end

  context "test NIL TAG validation" do
    let(:content) { build(:content, page: page, tag: nil) }

    it { expect {
          content.save
        }.to change(Content, :count).by(0)
      }
  end

  context "test NIL TEXT validation" do
    let(:content) { build(:content, page: page, text: nil) }

    it { expect {
          content.save
        }.to change(Content, :count).by(0)
      }
  end

  context "test NIL Page validation" do
    let(:content) { build(:content, page: nil) }

    it { expect {
          content.save
        }.to change(Content, :count).by(0)
      }
  end
end
