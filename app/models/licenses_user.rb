class LicensesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :license
end