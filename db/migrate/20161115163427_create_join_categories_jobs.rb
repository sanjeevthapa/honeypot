class CreateJoinCategoriesJobs < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :categories
    add_foreign_key :categories_jobs, :jobs
    add_foreign_key :categories_jobs, :categories
  end
end
