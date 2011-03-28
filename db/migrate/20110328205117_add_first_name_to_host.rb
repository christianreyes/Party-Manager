class AddFirstNameToHost < ActiveRecord::Migration
  def self.up
    add_column :hosts, :first_name, :string
  end

  def self.down
    remove_column :hosts, :first_name
  end
end
