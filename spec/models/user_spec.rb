require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:friends) }

    it { should have_many(:friendships) }

    it { should have_many(:likes) }

    it { should have_many(:comments) }

    it { should have_many(:pictures) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
