class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :init_cart
         
  has_many :products
  has_one :cart, dependent: :destroy
  
  
  

  def init_cart
    self.create_cart!
  end
  
end
