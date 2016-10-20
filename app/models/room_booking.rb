class RoomBooking < ActiveRecord::Base
  before_save :room_status

  STATUSES = %w(booked waiting canceled free).freeze

  #Associations
  belongs_to :user
  belongs_to :conference_room

  validates :room_id,
    presence: true
  validates :user_id,
    presence: true
  validates :status,
    presence: true,
    length: { maximum: 16 },
    inclusion: { in: STATUSES }

  def room_status
    unless room_booked?
      self.status = 'waiting'
    end
  end

  def room_booked?
    not RoomBooking.where(room_id: self.room_id).where(status: 'booked').where(start_date: self.start_date).present?
    end
end
