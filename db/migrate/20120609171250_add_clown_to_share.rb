class AddClownToShare < ActiveRecord::Migration
  def self.up
    add_column :shares, :who_shared, :string
  end

  def self.down
    remove_column :shares, :who_shared
  end
end
