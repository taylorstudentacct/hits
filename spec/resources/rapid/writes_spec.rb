require 'rails_helper'

RSpec.describe RapidResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'rapids',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RapidResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Rapid.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:rapid) { create(:rapid) }

    let(:payload) do
      {
        data: {
          id: rapid.id.to_s,
          type: 'rapids',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RapidResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { rapid.reload.updated_at }
      # .and change { rapid.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:rapid) { create(:rapid) }

    let(:instance) do
      RapidResource.find(id: rapid.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Rapid.count }.by(-1)
    end
  end
end
