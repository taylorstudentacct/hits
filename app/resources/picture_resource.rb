class PictureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rapid_id, :integer
  attribute :uploaded_by, :integer
  attribute :picture, :string

  # Direct associations

  # Indirect associations

end
