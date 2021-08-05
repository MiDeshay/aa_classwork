require 'securerandom'

class ShortenedUrl < ApplicationRecord

    def self.random_code
        random_string = SecureRandom.urlsafe_base64
        until !ShortenedUrl.exists?(:short_url => random_string)
            random_string = SecureRandom.urlsafe_base64
        end

        return random_string
    end


end

