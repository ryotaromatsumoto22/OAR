class AddUserIdToProjectDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :project_data, :user_id, :integer
  end
end
