class LicensesUsers < ActiveRecord::Migration
  def change
    create_table :licenses_users, :id => false do |t|
      t.integer :license_id
      t.integer :user_id
    end
  end
end
