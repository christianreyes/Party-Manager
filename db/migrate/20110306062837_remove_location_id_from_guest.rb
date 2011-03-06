class RemoveLocationIdFromGuest < ActiveRecord::Migration
  def self.up
    remove_column :guests, :location_id
  end

  def self.down
    add_column :guests, :location_id, :integer
  end
end
