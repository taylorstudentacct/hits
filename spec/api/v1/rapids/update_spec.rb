require "rails_helper"

RSpec.describe "rapids#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/rapids/#{rapid.id}", payload
  end

  describe "basic update" do
    let!(:rapid) { create(:rapid) }

    let(:payload) do
      {
        data: {
          id: rapid.id.to_s,
          type: "rapids",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(RapidResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { rapid.reload.attributes }
    end
  end
end
