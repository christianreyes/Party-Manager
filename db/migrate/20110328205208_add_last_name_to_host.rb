class AddLastNameToHost < ActiveRecord::Migration
  def self.up
    add_column :hosts, :last_name, :string
  end

  def self.down
    remove_column :hosts, :last_name
  end
end
