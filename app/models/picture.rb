class Picture < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  has_many   :likes,
             dependent: :destroy

  has_many   :comments,
             dependent: :destroy

  belongs_to :rapid,
             counter_cache: true

  belongs_to :rafter,
             class_name: "User",
             foreign_key: "uploaded_by",
             counter_cache: true

  # Indirect associations

  has_one    :friendship,
             through: :rafter,
             source: :friendships

  has_one    :river,
             through: :rapid,
             source: :river

  # Validations

  # Scopes

  def to_s
    rapid.to_s
  end
end
