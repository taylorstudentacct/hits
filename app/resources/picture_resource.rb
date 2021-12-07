class PictureResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :rapid_id, :integer
  attribute :uploaded_by, :integer
  attribute :picture, :string

  # Direct associations

  has_many   :likes

  has_many   :comments

  belongs_to :rapid

  belongs_to :rafter,
             resource: UserResource,
             foreign_key: :uploaded_by

  # Indirect associations

end
