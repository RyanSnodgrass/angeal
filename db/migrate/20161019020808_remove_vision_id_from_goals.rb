class RemoveVisionIdFromGoals < ActiveRecord::Migration[5.0]
  def change
    remove_column :goals, :vision_id, :integer
  end
end
