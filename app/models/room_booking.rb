class RoomBooking < ActiveRecord::Base

  STATUSES = %w(booked waiting canceled free).freeze

  #Callbacks
  before_save :room_status
  after_create :booking_confirmation
  after_save :booking_cancelation

  #Associations
  belongs_to :user
  belongs_to :conference_room

  #Validations
  validates :conference_room_id,
    presence: true
  validates :user_id,
    presence: true
  validates :status,
    presence: true,
    length: { maximum: 16 },
    inclusion: { in: STATUSES }

  def room_status
    unless room_booked?
      if self.status == 'booked'
        self.status = 'waiting'
      elsif self.status = 'waiting'
        self.status = 'canceled'
      end
    end
  end

  def booking_confirmation
    UserMailer.booking_confirm_email(self.user, self).deliver
  end

  def booking_cancelation
    if self.status == 'canceled'
      UserMailer.booking_cancelation_email(self.user, self).deliver
    else
      return
    end
  end

  def room_booked?
    not RoomBooking.where(conference_room_id: self.conference_room_id).where(status: 'booked').where(start_date: self.start_date).present?
  end
end
