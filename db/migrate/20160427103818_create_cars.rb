class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :number
      t.string :make
      t.string :device_id
      t.decimal :latitude, :precision => 10, :scale => 7
      t.decimal :longitude, :precision => 10, :scale => 7

      t.timestamps null: false
    end
  end
end
