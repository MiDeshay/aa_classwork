class User < ApplicationRecord
    validates :username, :password_digest, presence: true
    attr_reader :password
    #SPIRE

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
    end

    def is_password?(password)

    end

    def reset_session_token!

    end

    def ensure_sesion_token

    end
end
