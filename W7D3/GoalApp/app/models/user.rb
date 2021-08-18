class User < ApplicationRecord
    validates :username, :password_digest, :email, :session_token, presence: true
    validates :username, :session_token, uniqueness: true
    validates :password, length: {minimum: 6}

    attr_accessor :password

    has_many :goals
      class_name: :Goal
end
