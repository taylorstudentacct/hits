class PictureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rapid_id, :integer
  attribute :uploaded_by, :integer
  attribute :picture, :string

  # Direct associations

  belongs_to :rafter,
             resource: UserResource,
             foreign_key: :uploaded_by

  # Indirect associations

end
