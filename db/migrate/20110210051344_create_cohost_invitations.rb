class CreateCohostInvitations < ActiveRecord::Migration
  def self.up
    create_table :cohost_invitations do |t|
      t.integer :id
      t.integer :party_id
      t.integer :user_id
      t.string :invite_name
      t.string :invite_email
      t.string :invite_code
      t.boolean :agree
      t.timestamps
    end
  end

  def self.down
    drop_table :cohost_invitations
  end
end
