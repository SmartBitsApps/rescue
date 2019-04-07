class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_create :init_user_role
  after_create :init_cart
         
  has_many :products
  has_one :cart, dependent: :destroy
  
  enum role: [:user, :manager, :admin]
  
  # Create cart for new user
  def init_cart
    self.create_cart!
  end
  
  def init_user_role
    self.role = "user"
  end
  
end
