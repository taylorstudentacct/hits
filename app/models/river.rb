class River < ApplicationRecord
  # Direct associations

  has_many   :rapids,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
