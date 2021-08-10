class Response < ApplicationRecord

    belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

    belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

    belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question
end