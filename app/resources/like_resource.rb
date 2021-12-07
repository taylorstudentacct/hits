class LikeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :picture_id, :integer
  attribute :liked_by, :integer

  # Direct associations

  belongs_to :picture

  belongs_to :liker,
             resource: UserResource,
             foreign_key: :liked_by

  # Indirect associations
end
