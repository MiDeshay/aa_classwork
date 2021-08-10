class RemoveQuestionIdFromResponses < ActiveRecord::Migration[6.1]
  def change
    remove_column :responses, :question_id
  end
end
