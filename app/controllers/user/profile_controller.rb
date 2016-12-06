class User::ProfileController < ApplicationController
  before_action :authorize
  def index
    @resume=JobSeekerResume.find_by user_id: current_user.id
  end
end
