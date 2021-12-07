require 'rails_helper'

RSpec.describe "rapids#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/rapids", params: params
  end

  describe 'basic fetch' do
    let!(:rapid1) { create(:rapid) }
    let!(:rapid2) { create(:rapid) }

    it 'works' do
      expect(RapidResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['rapids'])
      expect(d.map(&:id)).to match_array([rapid1.id, rapid2.id])
    end
  end
end
