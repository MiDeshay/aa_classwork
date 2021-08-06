class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.integer :shortened_id, null: false
      t.integer :user_id, null: false
    end
  end
end
