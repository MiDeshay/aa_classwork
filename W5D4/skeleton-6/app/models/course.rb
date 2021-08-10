class Course < ApplicationRecord
    has_many :users,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :User
end
