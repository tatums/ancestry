class AddIndexToKits < ActiveRecord::Migration
  def self.up
    add_index :kits, :ancestry
  end

  def self.down
    remove_index :kits, :ancestry
  end
end
