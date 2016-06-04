class AddAvailableToCars < ActiveRecord::Migration
  def change
    add_column :cars, :available, :boolean, default: true
  end
end
