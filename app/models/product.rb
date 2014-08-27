class Product < ActiveRecord::Base
  belongs_to :category
  
  validates :name, :description, :price, presence: true
  validates :name, length: { in:2..32 }, format: { with: /[A-Za-z]/ }, uniqueness: { case_sensitive: false }
  validates :description, format: { with: /[A-Za-z]/ }
  validates :price, numericality: true
end