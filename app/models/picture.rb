class Picture < ApplicationRecord
  # Direct associations

  belongs_to :rafter,
             :class_name => "User",
             :foreign_key => "uploaded_by",
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    rapid.to_s
  end

end
