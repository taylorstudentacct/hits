require "rails_helper"

RSpec.describe RiverResource, type: :resource do
  describe "serialization" do
    let!(:river) { create(:river) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(river.id)
      expect(data.jsonapi_type).to eq("rivers")
    end
  end

  describe "filtering" do
    let!(:river1) { create(:river) }
    let!(:river2) { create(:river) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: river2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([river2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:river1) { create(:river) }
      let!(:river2) { create(:river) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      river1.id,
                                      river2.id,
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
                                      river2.id,
                                      river1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
