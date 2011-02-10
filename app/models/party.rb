class Party < ActiveRecord::Base
    attr_accessible :id, :name, :host_id, :details, :party_type_id, :date, :start_time, :end_time, :rsvp_date, :location_id, :public_party, :public_guestlist
end
