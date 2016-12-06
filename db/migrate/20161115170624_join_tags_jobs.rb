class JoinTagsJobs < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :tags
    add_foreign_key :jobs_tags, :jobs
    add_foreign_key :jobs_tags, :tags
  end
end
