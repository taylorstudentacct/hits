class User < ApplicationRecord
  
  include JwtToken
# Direct associations

  has_many   :likes,
             :foreign_key => "liked_by",
             :dependent => :destroy

  has_many   :comments,
             :foreign_key => "created_by",
             :dependent => :destroy

  has_many   :pictures,
             :foreign_key => "uploaded_by",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
