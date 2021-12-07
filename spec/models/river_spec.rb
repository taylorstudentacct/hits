require 'rails_helper'

RSpec.describe River, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:rapids) }

    end

    describe "InDirect Associations" do

    it { should have_many(:pictures) }

    end

    describe "Validations" do

    end
end
