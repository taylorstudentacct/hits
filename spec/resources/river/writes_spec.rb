require "rails_helper"

RSpec.describe RiverResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "rivers",
          attributes: {},
        },
      }
    end

    let(:instance) do
      RiverResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { River.count }.by(1)
    end
  end

  describe "updating" do
    let!(:river) { create(:river) }

    let(:payload) do
      {
        data: {
          id: river.id.to_s,
          type: "rivers",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      RiverResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { river.reload.updated_at }
      # .and change { river.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:river) { create(:river) }

    let(:instance) do
      RiverResource.find(id: river.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { River.count }.by(-1)
    end
  end
end
