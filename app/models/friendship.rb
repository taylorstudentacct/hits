class Friendship < ApplicationRecord
  # Direct associations

  belongs_to :friend2,
             class_name: "User"

  belongs_to :friend1,
             class_name: "User",
             counter_cache: true

  # Indirect associations

  has_one    :picture,
             through: :friend1,
             source: :pictures

  # Validations

  # Scopes

  def to_s
    friend1.to_s
  end
end
