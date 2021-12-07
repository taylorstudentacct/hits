require "rails_helper"

RSpec.describe "friendships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/friendships/#{friendship.id}"
  end

  describe "basic destroy" do
    let!(:friendship) { create(:friendship) }

    it "updates the resource" do
      expect(FriendshipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Friendship.count }.by(-1)
      expect { friendship.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
