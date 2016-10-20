class ChangeRoomIdFromRoomBooking < ActiveRecord::Migration
  def change
    remove_column :room_bookings, :room_id
    add_column :room_bookings, :conference_room_id, :integer
  end
end
