class RemoveGoals < ActiveRecord::Migration[5.0]
  def change
    drop_table :goals
  end
end
