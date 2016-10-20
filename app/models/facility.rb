class Facility < ActiveRecord::Base
  has_and_belongs_to_many :conference_rooms
end
