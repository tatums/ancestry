class Kit < ActiveRecord::Base
  has_ancestry

  has_many :kit_products, :include => :product
  has_many :products, :through => :kit_products

  def all_products_including_children
    all_products ||= [] << products
    children.each do |child_kit|
      all_products << child_kit.products
      child_kit.all_products_including_children
    end
    return all_products.flatten
  end

end
