class UserMailer < ApplicationMailer

  def password_reset(user)
    @user = user
    mail to: @user.email , subject: "Password Reset" do |format|
      format.text
    end
  end

  def user_register(user)
    @user = user
    mail to: @user.email , subject: "New user registered" do |format|
      format.text
    end
  end
end
