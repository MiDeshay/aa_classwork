class DropPollsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :polls
  end
end
