class User < ApplicationRecord
  validates_uniqueness_of :username, :session_token
  validates_presence_of :username, :password_digest, :session_token
  validates :password, length: {minimum: 6}, allow_nil: true

  attr_reader :password

  after_initialize :ensure_session_token

  has_many :cats,
    foreign_key: :user_id,
    class_name: "Cat"

  has_many :cat_rental_requests,
  foreign_key: :user_id,
  class_name: :CatRentalRequest

  def self.find_by_credentials(user_name, password)
    user = User.find_by(username: user_name)
    if user && user.is_password?(password)
      user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  def is_password?(password)
    password_object = BCrypt::Password.new(self.password_digest)
    password_object.is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
    self.session_token
  end
end
