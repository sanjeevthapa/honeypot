class User < ApplicationRecord
  has_one :job_seeker_resume
  accepts_nested_attributes_for :job_seeker_resume
  has_secure_password
  validates :username, :on => :create, presence: true
  validates :password, :on => :create, length: {minimum: 6}
  validates :password_confirmation, :on => :create, presence: true
  validates :email, presence: true, :on => :create, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create },uniqueness: true
  validates_acceptance_of :terms, :accept => true, :message => "Terms and contditions must be accepted"
  before_create { generate_token(:auth_token) }

  enum gender: [:male, :female]




  # generating unique token for password reset
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    self.save
    UserMailer.password_reset(self).deliver
  end
  def register_user
    self.status = false
    generate_token(:verify_token)
    self.verify_token_sent_at = Time.zone.now
    self.save
    UserMailer.user_register(self).deliver
  end

  # generates unique random primary key that gets stored in auth_token when registered or when password is reset
  def generate_token(column=nil)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
