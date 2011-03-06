class AddHostIdToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :host_id, :integer
  end

  def self.down
    remove_column :locations, :host_id
  end
end
