class River < ApplicationRecord
  # Direct associations

  has_many   :rapids,
             :dependent => :destroy

  # Indirect associations

  has_many   :pictures,
             :through => :rapids,
             :source => :pictures

  # Validations

  # Scopes

  def to_s
    name
  end

end
