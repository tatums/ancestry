class AddTestData < ActiveRecord::Migration
  def self.up
    10.times do |i|
      Product.create(:title => "Product #{i+1}")
    end

    10.times do |i|
      Kit.create(:title => "Kit #{i+1}")
    end
  end

  def self.down
    Product.delete_all
    Kit.delete_all
  end

end
