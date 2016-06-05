class CarBookingsController < ApplicationController

  def close_trip
    car = Car.find_by_device_id(params[:device_id])
    current_booking = CarBooking.find_by_car_id_and_status(car.id, CarBooking::Status::SCHEDULED)
    current_booking.update_attributes(:end_time => Time.now, :end_latitude => car.latitude,
                                      :end_longitude => car.longitude, :status => CarBooking::Status::CLOSED)
    car.update_attributes(:available => true)
    render json: current_booking
  end
end