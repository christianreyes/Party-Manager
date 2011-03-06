# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110306064047) do

  create_table "cohost_invitations", :force => true do |t|
    t.integer  "party_id"
    t.integer  "user_id"
    t.string   "invite_name"
    t.string   "invite_email"
    t.string   "invite_code"
    t.boolean  "agree"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gifts", :force => true do |t|
    t.integer  "guest_invitation_id"
    t.text     "description"
    t.date     "note_sent_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guest_invitations", :force => true do |t|
    t.integer  "party_id"
    t.integer  "guest_id"
    t.integer  "invited_by"
    t.string   "invite_code"
    t.integer  "expected_attendees"
    t.integer  "actual_attendees"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "guests", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "host_id"
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host_id"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "details"
    t.integer  "party_type_id"
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.date     "rsvp_date"
    t.integer  "location_id"
    t.boolean  "public_party",     :default => true
    t.boolean  "public_guestlist", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "party_types", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.boolean  "administrator", :default => false
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
