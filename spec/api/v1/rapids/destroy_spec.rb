require 'rails_helper'

RSpec.describe "rapids#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/rapids/#{rapid.id}"
  end

  describe 'basic destroy' do
    let!(:rapid) { create(:rapid) }

    it 'updates the resource' do
      expect(RapidResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Rapid.count }.by(-1)
      expect { rapid.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
