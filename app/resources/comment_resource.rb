class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :picture_id, :integer
  attribute :text, :string
  attribute :created_by, :integer

  # Direct associations

  belongs_to :picture

  belongs_to :commentor,
             resource: UserResource,
             foreign_key: :created_by

  # Indirect associations
end
