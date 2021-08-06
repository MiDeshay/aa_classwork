class Visit < ApplicationRecord

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: "User"

    belongs_to :shortened_url,
        primary_key: :id,
        foreign_key: :shortened_id,
        class_name: "ShortenedUrl"

end