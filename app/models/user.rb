class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  # не работает на четвертых рельсах http://stackoverflow.com/questions/23437830/undefined-method-attr-accessible attr_accessible :name, :email, :password, :password_confirmation
  before_create :create_remember_token
  #ещё для токена


  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  attr_accessor :remember_token
  #дважды сука сохраняю токен 

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

  #def remember
  #self.update_attribute(:remember_digest, new_token)
  #end
  #добавил это т.к. он не находит ремембер токен методд

  #def remember(user)
  #user.remember 
  #cookies.permanent[:remember_token] = user.remember_digest
  #cookies.permament.signed[:user_id] = user.id
  #end
    #добавил это т.к. он не находит ремембер токен методд


  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def feed
    # Это предварительное решение. См. полную реализацию в "Following users".
    Micropost.where("user_id = ?", id)
  end

  private


    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end