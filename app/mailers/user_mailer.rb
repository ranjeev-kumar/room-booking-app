class UserMailer < ApplicationMailer

  default from: "ranjeev.wwindia@gmail.com"

  def welcome_email(user)
    @user = user
    @url = root_url + "users/sign_in"
    mail(to: @user.email, subject: 'Welcome to My Room Booking app.')
  end

  def booking_confirm_email(user, booking)
    @user = user
    @room_booking = booking
    @url = root_url + "users/room_bookings"
    mail(to: @user.email, subject: 'Booking Confirmation')
  end

  def booking_cancelation_email(user, booking)
    @user = user
    @room_booking = booking
    @url = root_url + "users/room_bookings"
    mail(to: @user.email, subject: 'Booking Confirmation')
  end
end
