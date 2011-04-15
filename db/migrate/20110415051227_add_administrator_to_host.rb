class AddAdministratorToHost < ActiveRecord::Migration
  def self.up
    add_column :hosts, :administrator, :boolean
  end

  def self.down
    remove_column :hosts, :administrator
  end
end
