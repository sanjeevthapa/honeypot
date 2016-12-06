class CreateUserQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :user_queries do |t|
      t.string :name
      t.text :email
      t.text :message

      t.timestamps
    end
  end
end
