class CreateConferenceRoomsFacilities < ActiveRecord::Migration
  def change
    create_table :conference_rooms_facilities, id: false do |t|
      t.belongs_to :conference_room, index: true
      t.belongs_to :facility, index: true
    end
  end
end
