require 'rails_helper'

RSpec.describe "rapids#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rapids/#{rapid.id}", params: params
  end

  describe 'basic fetch' do
    let!(:rapid) { create(:rapid) }

    it 'works' do
      expect(RapidResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('rapids')
      expect(d.id).to eq(rapid.id)
    end
  end
end
