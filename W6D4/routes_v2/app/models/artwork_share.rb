class ArtworkShare < ApplicationRecord
    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    has_many :shared_viewers,
        through: :viewer,
        source: :artwork_shares
end