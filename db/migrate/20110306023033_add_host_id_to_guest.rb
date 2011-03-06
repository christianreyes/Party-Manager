class AddHostIdToGuest < ActiveRecord::Migration
  def self.up
    add_column :guests, :host_id, :integer
  end

  def self.down
    remove_column :guests, :host_id
  end
end
