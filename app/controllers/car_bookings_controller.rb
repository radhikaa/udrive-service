class CarBookingsController < ApplicationController
  before_action :load_models

  def start_trip
    @current_booking.update_attributes(start_time: DateTime.now, start_latitude: params[:latitude], start_longitude: params[:longitude])
    render json: @current_booking
  end

  def close_trip
    @current_booking.update_attributes(:end_time => Time.now, :end_latitude => @car.latitude,
                                      :end_longitude => @car.longitude, :status => CarBooking::Status::CLOSED)
    @car.update_attributes(:available => true)
    render json: @current_booking
  end

  private
  def load_models
    @car = Car.find_by_device_id(params[:device_id])
    @current_booking = CarBooking.find_by_car_id_and_status(@car.id, CarBooking::Status::SCHEDULED)
  end
end