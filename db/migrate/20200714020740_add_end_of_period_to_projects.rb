class AddEndOfPeriodToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :end_of_period, :datetime
  end
end
