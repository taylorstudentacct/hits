require "rails_helper"

RSpec.describe FriendshipResource, type: :resource do
  describe "serialization" do
    let!(:friendship) { create(:friendship) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(friendship.id)
      expect(data.jsonapi_type).to eq("friendships")
    end
  end

  describe "filtering" do
    let!(:friendship1) { create(:friendship) }
    let!(:friendship2) { create(:friendship) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: friendship2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([friendship2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:friendship1) { create(:friendship) }
      let!(:friendship2) { create(:friendship) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      friendship1.id,
                                      friendship2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      friendship2.id,
                                      friendship1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
