class CarBooking < ActiveRecord::Base
  module Status
    SCHEDULED="scheduled"
    CANCELLED="cancelled"
    CLOSED="closed"
  end
  belongs_to :car
  belongs_to :user

  def compute_amount
    distance * 12;
  end
end