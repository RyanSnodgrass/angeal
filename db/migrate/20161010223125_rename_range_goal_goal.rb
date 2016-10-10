class RenameRangeGoalGoal < ActiveRecord::Migration[5.0]
  def change
    rename_table :range_goals, :goals
  end
end
