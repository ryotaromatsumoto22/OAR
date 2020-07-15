class CreateProjectData < ActiveRecord::Migration[5.2]
  def change
    create_table :project_data do |t|
      t.integer :project_id
      t.integer :hour
      t.datetime :date

      t.timestamps
    end
  end
end
