class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.integer :party_type_id
      t.integer :host_id
      t.string :name
      t.date :date
      t.integer :location_id
      t.time :start_time
      t.time :end_time
	  t.boolean :public_guestlist
      t.text :description
      t.date :rsvp_date

      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
