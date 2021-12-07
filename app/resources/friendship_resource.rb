class FriendshipResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :friend1_id, :integer
  attribute :friend2_id, :integer

  # Direct associations

  belongs_to :friend2,
             resource: UserResource

  belongs_to :friend1,
             resource: UserResource

  # Indirect associations

  has_one    :picture
end
