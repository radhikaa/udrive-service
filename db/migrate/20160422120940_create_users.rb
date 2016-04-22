class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :full_name, :string
      t.column :age, :integer
      t.column :email, :string
      t.column :password, :string
      t.column :sex, :string
      t.timestamps
    end
  end
end
