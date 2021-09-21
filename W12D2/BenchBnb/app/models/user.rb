class User < ApplicationRecord
    validates :username, :password_digest, presence: true
    attr_reader :password
    #SPIRE
    after_initialize :ensure_sesion_token

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if !user

        if user.is_password?(password)
            return user
        else 
            return nil
        end

    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64
        self.save
        self.session_token
    end

    def ensure_sesion_token
        self.session_token ||= SecureRandom.urlsafe_base64
    end
end
