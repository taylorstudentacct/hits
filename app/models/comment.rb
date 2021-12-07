class Comment < ApplicationRecord
  # Direct associations

  belongs_to :picture,
             :counter_cache => true

  belongs_to :commentor,
             :class_name => "User",
             :foreign_key => "created_by",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    picture.to_s
  end

end
