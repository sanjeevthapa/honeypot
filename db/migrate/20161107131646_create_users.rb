class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :auth_token
      t.string :password_reset_token
      t.datetime :password_reset_sent_at
      t.boolean :status
      t.string :verify_token
      t.datetime :verify_token_sent_at
      t.boolean :terms

      t.timestamps
    end
  end
end
