class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.integer :hour
      t.datetime :date
      t.string :goal
      t.string :period
      t.integer :level

      t.timestamps
    end
  end
end
