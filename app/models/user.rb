class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :room_bookings
  has_many :conference_rooms, through: :room_bookings

  # Callbacks
  after_create :welcome_user

  private
    def welcome_user
      UserMailer.welcome_email(self).deliver
    end

end
