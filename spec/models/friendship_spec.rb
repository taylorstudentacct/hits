require "rails_helper"

RSpec.describe Friendship, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:friend2) }

    it { should belong_to(:friend1) }
  end

  describe "InDirect Associations" do
    it { should have_one(:picture) }
  end

  describe "Validations" do
  end
end
