class User < ApplicationRecord
    validates :username, :password_digest, :email, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6}

    attr_reader :password

    # SPIRE

    def self.find_by_credentials(username, password)
      user = User.find_by(username: username)
      if user && user.is_password?(password)
        user
      else
        nil
      end
    end

    def password=(password)
      @password = password
      self.password_digest = BCrypt::Password.create(password)
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

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

end
