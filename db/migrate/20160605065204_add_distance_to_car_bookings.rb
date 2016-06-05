class AddDistanceToCarBookings < ActiveRecord::Migration
  def change
    add_column :car_bookings, :distance, :decimal, default:0, :precision => 10, :scale => 7
  end
end
