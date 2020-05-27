class CreateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :color

      t.timestamps
    end
  end
end
