class User::SessionController < ApplicationController
  def index
    @user= User.new
  end

  def new
    # creating new user
    @user=User.create(user_params)
      if @user.save
      # register user by sending mail for verifying user
        @user.register_user
        flash[:notice] = "Please check your email to verify your sign up"
        return redirect_to '/'
      else
        return render "signup"
      end
  end

  def signup
    # loading register form
    @user=User.new
  end

  def destroy
    # deleting the unique auth token
    cookies.delete(:auth_token)
    flash[:notice] = "Successfully logged out!"
    redirect_to '/'
  end

  def create
    # checking if the form fields are empry and redirecting with message
    email = params[:email]
    password = params[:password]
    if email.blank? && password.blank?
      flash[:error] = "Please enter your email and password."
      return redirect_to '/login'
    elsif email.blank?
        flash[:error] = "Please enter your email."
        return redirect_to '/login'
    elsif password.blank?
      flash[:error] = "Please enter your password."
      @redirValue = email
      @user=User.new
       return render 'index'
    else
      @user = User.find_by_email(email)
        # If the user exists AND the password entered is correct.
        if @user && @user.authenticate(password)
          if @user.status == true
          # Save the unique token inside the browser cookie. This is how we keep the user
          # logged in when they navigate around our website.
          if params[:remember_me]
            # here, a permanent cookie is set so that the user is redirected next time when he opens the browser if he hasn't logged out
            cookies.permanent[:auth_token] = @user.auth_token
            flash[:notice] = "#{@user.email.capitalize} is logged in."
            return redirect_to profile_url
          else
            cookies[:auth_token] = @user.auth_token
            flash[:notice] = "#{@user.email} is logged in."
            return redirect_to profile_url
          end
          else
            flash[:notice] = "Please verify your email first"
            return redirect_to '/'
          end

        else
        # If user's login doesn't work, send them back to the login form.
          flash[:error] = "Credentials not found"
          return redirect_to '/login'
      end
    end
  end

  def verify
    @user = User.find_by_verify_token(params[:id])
    #@user.status = true
    if @user
      if @user.verify_token_sent_at < 2.hours.ago
        redirect_to '/', :notice => "User verify token has expired."
      else
        @user.update_attribute(:status, true)
        flash[:notice]="#{@user.email} is verified to login"
        return redirect_to '/login'
      end
    else
      flash[:notice]="Invalid token please check your email to verify your sign up"
      return redirect_to '/'
    end
  end

  private
  # sanitizing the data from the form, allowing only the white list through.
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation,:terms)
  end
end
