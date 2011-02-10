class CreateParties < ActiveRecord::Migration
  def self.up
    create_table :parties do |t|
      t.integer :id
      t.string :name
      t.integer :host_id
      t.text :details
      t.integer :party_type_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.date :rsvp_date
      t.integer :location_id
      t.boolean :public_party
      t.boolean :public_guestlist
      t.timestamps
    end
  end

  def self.down
    drop_table :parties
  end
end
