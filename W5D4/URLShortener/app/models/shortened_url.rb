require 'securerandom'

class ShortenedUrl < ApplicationRecord

    def self.random_code
        random_string = SecureRandom.urlsafe_base64
        return random_string
    end


end

