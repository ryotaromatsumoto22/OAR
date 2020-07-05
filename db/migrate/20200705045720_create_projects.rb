class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|


      t.integer :user_id
      t.string :name
      t.string :goal
      t.string :period
      t.integer :progress
      t.timestamps
    end
  end
end
