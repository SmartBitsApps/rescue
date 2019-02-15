class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  belongs_to :user, optional: true
  
  
  validates :title, presence: true
  validates :title, presence: true, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed."}
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }
  
  BRAND = %w{ Staropramen Pepsi }
  
end
