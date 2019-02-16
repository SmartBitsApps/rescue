class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  before_destroy :not_referenced_by_any_line_item
  
  belongs_to :user, optional: true
  has_many :line_items
  
  
  validates :title, presence: true
  validates :title, presence: true, length: { maximum: 140, too_long: "%{count} characters is the maximum allowed."}
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed."}
  validates :price, numericality: { only_integer: true }, length: { maximum: 7 }
  
  BRAND = %w{ Staropramen Pepsi }
  
  private
  
    def not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, "Košík není prázdný.")
        throw :abort
      end
    end
  
end
