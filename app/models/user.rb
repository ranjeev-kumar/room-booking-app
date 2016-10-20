class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #Associations
  has_many :room_bookings
  has_many :conference_rooms, through: :room_bookings

  #Validations
  validates :name, length: { minimum: 3, too_short: "should be atleast 1 characters long."}
end
