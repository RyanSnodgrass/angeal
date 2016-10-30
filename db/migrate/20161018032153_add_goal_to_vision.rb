class AddGoalToVision < ActiveRecord::Migration[5.0]
  def change
    remove_column :goals, :vision_id
    add_reference :goals, :vision, index: true
  end
end
