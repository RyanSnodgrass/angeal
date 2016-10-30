class AddVisionReferenceToGoals < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :vision, index: true
  end
end
