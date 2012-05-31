class Product < ActiveRecord::Base
  has_many :kit_products
  has_many :kits, :through => :kit_products
end
