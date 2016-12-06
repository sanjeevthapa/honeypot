class User::AddResumesController < ApplicationController
  before_action :authorize
  def index
    unless current_user
      flash.now[:notice]="Have an account? If you don’t have an account you can create one below by entering your email address. A password will be automatically emailed to you."
    end
    @resume=JobSeekerResume.find_or_create_by user_id: current_user.id
    @genders=User.genders
    @user=User.find_by(id: current_user.id)
    logger.info @resume.user.inspect
  end
  def update
    @resume= JobSeekerResume.find_or_create_by user_id: current_user.id
    @resume=@resume.update_attributes(user_resume_params)
    @genders=User.genders
    @user=User.find_by(id: current_user.id)
    @user=@user.update_attributes(user_params)
    if @resume && @user
      redirect_to profile_url
    else
      render "index"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name,:middle_name,:last_name,:dob,:mobile,:gender,:location)
  end

  def user_resume_params
    params.require(:job_seeker_resume).permit(:profession,:resume_content,:school_name,:qualification,:education_start_date,:education_end_date,:education_note,:employer,:job_title,:experience_institute,:experience_start_date,:experience_end_date,:experience_note)
  end
end
