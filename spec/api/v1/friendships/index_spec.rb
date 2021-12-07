require "rails_helper"

RSpec.describe "friendships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/friendships", params: params
  end

  describe "basic fetch" do
    let!(:friendship1) { create(:friendship) }
    let!(:friendship2) { create(:friendship) }

    it "works" do
      expect(FriendshipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["friendships"])
      expect(d.map(&:id)).to match_array([friendship1.id, friendship2.id])
    end
  end
end
