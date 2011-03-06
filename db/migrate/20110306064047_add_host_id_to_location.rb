class AddHostIdToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :host_id, :string
  end

  def self.down
    remove_column :locations, :host_id
  end
end
