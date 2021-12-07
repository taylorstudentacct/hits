require "rails_helper"

RSpec.describe "rivers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rivers/#{river.id}", params: params
  end

  describe "basic fetch" do
    let!(:river) { create(:river) }

    it "works" do
      expect(RiverResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("rivers")
      expect(d.id).to eq(river.id)
    end
  end
end
