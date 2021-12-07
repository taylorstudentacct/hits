class RapidResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :river_id, :integer
  attribute :location, :string
  attribute :description, :string
  attribute :difficulty, :integer

  # Direct associations

  has_many   :pictures

  belongs_to :river

  # Indirect associations
end
