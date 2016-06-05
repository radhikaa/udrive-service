class AddAmountToCarBookings < ActiveRecord::Migration
  def change
    add_column :car_bookings, :amount, :decimal, :precision => 10, :scale => 2
  end
end
