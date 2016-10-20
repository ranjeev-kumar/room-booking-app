class CreateRoomBookings < ActiveRecord::Migration
  def change
    create_table :room_bookings do |t|
      t.integer :room_id
      t.integer :user_id
      t.datetime :start_date
      t.string :status, default: 'booked'
      t.timestamps null: false
    end
  end
end
