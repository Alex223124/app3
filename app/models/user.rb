class User < ActiveRecord::Base
  # не работает на четвертых рельсах http://stackoverflow.com/questions/23437830/undefined-method-attr-accessible attr_accessible :name, :email, :password, :password_confirmation



  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  

  private


    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end