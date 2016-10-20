class CreateConferenceRooms < ActiveRecord::Migration
  def change
    create_table :conference_rooms do |t|
      t.string :room_no
      t.text :description

      t.timestamps null: false
    end
  end
end
