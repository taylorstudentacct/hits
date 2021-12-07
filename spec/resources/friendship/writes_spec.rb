require "rails_helper"

RSpec.describe FriendshipResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "friendships",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FriendshipResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Friendship.count }.by(1)
    end
  end

  describe "updating" do
    let!(:friendship) { create(:friendship) }

    let(:payload) do
      {
        data: {
          id: friendship.id.to_s,
          type: "friendships",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FriendshipResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { friendship.reload.updated_at }
      # .and change { friendship.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:friendship) { create(:friendship) }

    let(:instance) do
      FriendshipResource.find(id: friendship.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Friendship.count }.by(-1)
    end
  end
end
