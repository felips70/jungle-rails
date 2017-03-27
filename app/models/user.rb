class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  # validates :password_confirmation, presence: true
  validates :password, :length => { :minimum => 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = ?', email.strip.downcase).first
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
