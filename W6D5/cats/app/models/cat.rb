require 'action_view'

class Cat < ApplicationRecord
include ActionView::Helpers::DateHelper
    validates :color, inclusion: {in: %w(Red Green Yellow Blue Violet)}
    validates :sex, inclusion: {in: %w(M F)}
    validates :birth_date, :color, :name, :sex, :description, presence: true

    def age
        age= time_ago_in_words(birth_date)
    end
    
end
