class AddQuestionIdFromResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :question_id, :integer, null: false
  end
end
