class User < ActiveRecord::Base
  before_save :encrypt_password

  has_many :posts, inverse_of: :author

  attr_accessor :password

  validates_presence_of     :account, :email, :password
  validates_uniqueness_of   :account, :email
  validates_confirmation_of :password

  def self.authenticate(params)
    user = find_by(account: params[:account])

    user if user && user.password_hash ==
        BCrypt::Engine.hash_secret(
            [params[:account], user.email, params[:password]].join('-'),
            user.password_salt
        )
  end

  def to_s
    account
  end

  def to_param
    account
  end

  private

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret([account, email, password].join('-'), password_salt)
    end
  end

  def generate_secreat
    BCrypt::Engine.hash_secret([account, email, password].join('-'), password_salt)
  end
end
