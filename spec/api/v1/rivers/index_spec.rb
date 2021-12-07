require "rails_helper"

RSpec.describe "rivers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rivers", params: params
  end

  describe "basic fetch" do
    let!(:river1) { create(:river) }
    let!(:river2) { create(:river) }

    it "works" do
      expect(RiverResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["rivers"])
      expect(d.map(&:id)).to match_array([river1.id, river2.id])
    end
  end
end
