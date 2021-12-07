class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :username, :string
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :user_type, :string
  attribute :phone_number, :string

  # Direct associations

  has_many   :likes,
             foreign_key: :liked_by

  has_many   :comments,
             foreign_key: :created_by

  has_many   :pictures,
             foreign_key: :uploaded_by

  # Indirect associations

end
