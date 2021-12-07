require "rails_helper"

RSpec.describe "rivers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rivers/#{river.id}", payload
  end

  describe "basic update" do
    let!(:river) { create(:river) }

    let(:payload) do
      {
        data: {
          id: river.id.to_s,
          type: "rivers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RiverResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { river.reload.attributes }
    end
  end
end
