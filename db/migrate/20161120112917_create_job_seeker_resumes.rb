class CreateJobSeekerResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :job_seeker_resumes do |t|
      t.belongs_to :user, index: true,foreign_key: true
      t.string :profession
      t.text :resume_content
      t.string :school_name
      t.string :qualification
      t.date :education_start_date
      t.date :education_end_date
      t.text :education_note
      t.string :employer
      t.string :job_title
      t.string :experience_institute
      t.date :experience_start_date
      t.date :experience_end_date
      t.text :experience_note

      t.timestamps
    end
  end
end
