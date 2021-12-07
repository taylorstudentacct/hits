require 'rails_helper'

RSpec.describe Picture, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should belong_to(:rapid) }

    it { should belong_to(:rafter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
