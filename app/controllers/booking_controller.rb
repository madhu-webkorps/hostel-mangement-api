class BookingController < ApplicationController
    
  def index 
    all_booking = Booking.all
    render json:{
      message: "all bookings of romms are ",
      booked: all_booking
    }
  end 

  def create
    booking = Booking.new(booking_params)
    session[:user_email] = booking.email 
    room = Room.find_by(room_no: booking_params[:room_no])
    if booking.save 
        room.seater -= 1
        room.save!
        render json: {
          message: "your booking sucessfully for room #{room.room_no} please go for initial registration payment"
        }
    else
      render json: {
        error: booking.errors.full_messages
      }
    end

  end

  def booking_params
    params.require(:booking).permit(  :email, :first_name, :last_name, :contact_no,
                                      :room_no, :guardian_contact_no, :guardian_name,
                                      :address, :duration, :country, :organization, :addhar_no, 
                                    )
  end

  def pay_fee
      @stripe_public_key = Rails.application.config.stripe_publishable_key,
      @stripe_data = { successUrl:payment_success_url,
                      cancelUrl: payment_canceled_url}
      @stripe_data[:customerEmail] = session[:user_email]
  end

  def success;
    booking = Booking.find_by(email: session[:user_email])
    booking.registration_fees = true
    booking.save
  end

  def canceled;
  end

end
