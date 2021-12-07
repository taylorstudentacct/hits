require "rails_helper"

RSpec.describe "friendships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/friendships/#{friendship.id}", params: params
  end

  describe "basic fetch" do
    let!(:friendship) { create(:friendship) }

    it "works" do
      expect(FriendshipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("friendships")
      expect(d.id).to eq(friendship.id)
    end
  end
end
