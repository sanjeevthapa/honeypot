class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :companies, :users
  end
end
