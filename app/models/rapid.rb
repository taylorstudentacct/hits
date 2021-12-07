class Rapid < ApplicationRecord
  # Direct associations

  belongs_to :river,
             :counter_cache => true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
