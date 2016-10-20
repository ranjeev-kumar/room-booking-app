class ConferenceRoom < ActiveRecord::Base
  attr_accessor :facilities_fields

  #Associations
  has_many :room_bookings
  has_many :users, through: :room_bookings
  has_and_belongs_to_many :facilities
  accepts_nested_attributes_for :facilities
  #Validations
  validates :room_no, length: { minimum: 1, too_short: "should be atleast 1 characters long."}, format: { with: /[0-9Z]+/ }
  validates :description, length: { minimum: 2, too_short: "should be atleast 3 characters long."}

  #Callbacks
  after_save :create_facilities

  def create_facilities
    self.facilities.delete_all
    facilitites = Facility.where(id: self.facilities_fields[:id])
    self.facilities << facilitites
  end
end
