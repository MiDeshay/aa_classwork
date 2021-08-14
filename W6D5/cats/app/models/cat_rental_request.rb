class CatRentalRequest < ApplicationRecord
    validates :status, inclusion: {in: %w(PENDING DENIED APPROVED)}
    validates :cat_id, :status, :start_date, :end_date, presence: true

end
