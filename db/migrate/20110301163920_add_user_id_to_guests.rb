class AddUserIdToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :user_id, :integer
  end

  def self.down
    remove_column :guests, :user_id
  end
end
