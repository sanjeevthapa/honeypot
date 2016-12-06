class CreateJobSeekers < ActiveRecord::Migration[5.0]
  def change
    create_table :job_seekers do |t|
      t.integer :user_id

      t.timestamps
    end
    add_foreign_key :job_seekers, :users
  end
end
