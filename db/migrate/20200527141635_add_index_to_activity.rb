class AddIndexToActivity < ActiveRecord::Migration[6.0]
  def change
    add_index :activities, %i[user_id start_at]
    add_index :activities, %i[user_id end_at]
  end
end
