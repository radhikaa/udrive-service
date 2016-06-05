class AddRideDetailsToCarBookings < ActiveRecord::Migration
  def change
    add_column :car_bookings, :status, :string
    add_column :car_bookings, :start_time, :datetime
    add_column :car_bookings, :end_time, :datetime
    add_column :car_bookings, :start_latitude, :decimal, :precision => 10, :scale => 7
    add_column :car_bookings, :start_longitude, :decimal, :precision => 10, :scale => 7
    add_column :car_bookings, :end_latitude, :decimal, :precision => 10, :scale => 7
    add_column :car_bookings, :end_longitude, :decimal, :precision => 10, :scale => 7
  end
end
