require "rails_helper"

RSpec.describe Rapid, type: :model do
  describe "Direct Associations" do
    it { should have_many(:pictures) }

    it { should belong_to(:river) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
