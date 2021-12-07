require "rails_helper"

RSpec.describe "friendships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/friendships/#{friendship.id}", payload
  end

  describe "basic update" do
    let!(:friendship) { create(:friendship) }

    let(:payload) do
      {
        data: {
          id: friendship.id.to_s,
          type: "friendships",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FriendshipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { friendship.reload.attributes }
    end
  end
end
