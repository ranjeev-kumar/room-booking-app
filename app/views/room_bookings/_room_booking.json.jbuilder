json.extract! room_booking, :id, :room_id, :user_id, :created_at, :updated_at
json.url room_booking_url(room_booking, format: :json)