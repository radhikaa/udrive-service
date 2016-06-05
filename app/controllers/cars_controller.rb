class CarsController < ApplicationController
  before_action :set_car, only: [:show]

  def index
    render json: Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_location
    car = Car.find_by_device_id(params[:device_id])
    new_latitude = params[:latitude]
    new_longitude = params[:longitude]
    car.update_attributes(:latitude => new_latitude, :longitude => new_longitude)
    current_booking = CarBooking.find_by_car_id_and_status(car.id, CarBooking::Status::SCHEDULED)
    if current_booking
      updated_distance = current_booking.distance + car.distance_to([new_latitude, new_longitude])
      current_booking.update_attributes(:distance => updated_distance)
    end
    render json: {latitude: car.latitude, longitude: car.longitude}
  end

  def book
    user = User.where(email: params[:email]).first
    car = Car.find_by(id: params[:id])
    car_booking = CarBooking.new(car: car, user: user, status: CarBooking::Status::SCHEDULED)
    car.update_attributes(available: false) if car_booking.save
    render json: car_booking
  end

  def nearby_and_available
    cars = Car.nearby_and_available(params[:latitude].to_d, params[:longitude].to_d)
    render json: cars
  end

  private
  def set_car
    @car = Car.find(params[:id])
  end
  def car_params
    params.require(:car).permit(:name, :number, :make, :device_id, :latitude, :longitude)
  end
end
