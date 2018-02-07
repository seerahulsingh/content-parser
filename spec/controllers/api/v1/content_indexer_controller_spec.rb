require 'rails_helper'

describe "Api::V1::IndexContentsController", type: :request do
  let(:page) { build(:page) }

  describe "given a VALID url" do
    it "should index successfully" do
      post '/api/v1/index_contents', params: { url: page.url }
      expect(response).to be_ok
      expect(JSON.parse(response.body)["message"]).to eq("Successfully parsed content")
    end
  end

  describe "given a INVALID url" do
    it "should not index successfully" do
      post '/api/v1/index_contents', params: { url: 'xyz' }
      expect(response).to be_ok
      expect(JSON.parse(response.body)["message"]).to eq("Validation Errors")
    end
  end

  it "should return all saved indexes" do
    get '/api/v1/index_contents'
    expect(response).to be_ok
  end
end
