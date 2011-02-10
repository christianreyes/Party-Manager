class CreateGuestInvitations < ActiveRecord::Migration
  def self.up
    create_table :guest_invitations do |t|
      t.integer :id
      t.integer :party_id
      t.integer :guest_id
      t.integer :invited_by
      t.string :invite_code
      t.integer :expected_attendees
      t.integer :actual_attendees
      t.timestamps
    end
  end

  def self.down
    drop_table :guest_invitations
  end
end
