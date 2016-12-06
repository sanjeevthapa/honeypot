class JoinJobSeekersJobs < ActiveRecord::Migration[5.0]
  def change
    create_join_table :jobs, :job_seekers
    add_foreign_key :job_seekers_jobs, :jobs
    add_foreign_key :job_seekers_jobs, :job_seekers
  end
end
