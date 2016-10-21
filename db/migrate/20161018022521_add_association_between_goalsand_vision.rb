class AddAssociationBetweenGoalsandVision < ActiveRecord::Migration[5.0]
  def change
    add_column :goals, :vision_id, :integer
  end
end
