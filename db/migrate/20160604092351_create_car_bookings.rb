class CreateCarBookings < ActiveRecord::Migration
  def change
    create_table :car_bookings do |t|
      t.references :car
      t.references :user
      t.timestamps
    end

    add_foreign_key :car_bookings, :cars, on_delete: :cascade
    add_foreign_key :car_bookings, :users, on_delete: :cascade

    add_index :car_bookings, :car_id
    add_index :car_bookings, :user_id
  end
end
