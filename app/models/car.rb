class Car < ActiveRecord::Base
  reverse_geocoded_by :latitude, :longitude

  def self.nearby_and_available(latitude, longitude)
    Car.where(available: true).near([latitude, longitude], 20)
  end
end
