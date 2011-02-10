class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :id
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.float :latitude
      t.float :longitude
      t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :locations
  end
end
