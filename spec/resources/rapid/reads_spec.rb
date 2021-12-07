require 'rails_helper'

RSpec.describe RapidResource, type: :resource do
  describe 'serialization' do
    let!(:rapid) { create(:rapid) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(rapid.id)
      expect(data.jsonapi_type).to eq('rapids')
    end
  end

  describe 'filtering' do
    let!(:rapid1) { create(:rapid) }
    let!(:rapid2) { create(:rapid) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: rapid2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([rapid2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:rapid1) { create(:rapid) }
      let!(:rapid2) { create(:rapid) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            rapid1.id,
            rapid2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            rapid2.id,
            rapid1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
