class AddRemainsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :integer
    add_column :users, :dob, :date
    add_column :users, :age, :integer
    add_column :users, :mobile, :integer , limit: 8
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string

  end
end
