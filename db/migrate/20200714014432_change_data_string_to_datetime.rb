class ChangeDataStringToDatetime < ActiveRecord::Migration[5.2]
  def change
  	change_column :projects, :period, :datetime
  end
end
