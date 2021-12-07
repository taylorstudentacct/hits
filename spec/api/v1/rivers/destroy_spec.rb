require "rails_helper"

RSpec.describe "rivers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rivers/#{river.id}"
  end

  describe "basic destroy" do
    let!(:river) { create(:river) }

    it "updates the resource" do
      expect(RiverResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { River.count }.by(-1)
      expect { river.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
