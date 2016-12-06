class User::PasswordResetController < ApplicationController
  def index
  end

  def create
    if params[:email].blank?
        flash.now[:error] = "Please enter your email."
        render "index"
    else
    @user = User.find_by_email(params[:email])

    if @user && @user.send_password_reset
      redirect_to login_url, :notice => "Email sent with password reset instructions"
    else
      @redirValue=params[:email]
      flash.now[:notice] = "Email supplied did not match with any registered users"
      render "index"
    end
  end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
    unless @user
      flash[:notice]="Invalid token please check your email to verify your password reset"
      return redirect_to '/'
    end
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if params[:user].fetch('password',{}).blank? && params[:user].fetch('password_confirmation',{}).blank?
      flash.now[:error]="Password can't be blank"
      render :edit
    else
      if @user.password_reset_sent_at < 2.hours.ago
        redirect_to '/', :notice => "Password reset token has expired."
      elsif @user.update_attributes(password_reset_params)== true
        redirect_to login_url, :notice => "Password has been reset!"
      else
        render :edit
      end
    end
  end
  private
  def password_reset_params
    params.require(:user).permit(:password,:password_confirmation)
  end
end
