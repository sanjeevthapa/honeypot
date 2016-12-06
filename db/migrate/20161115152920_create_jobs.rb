class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :salary
      t.date :start_date
      t.date :end_date
      t.integer :company_id
      t.integer :job_type_id

      t.timestamps
    end
    add_foreign_key :jobs, :companies
    add_foreign_key :jobs, :job_types
  end
end
