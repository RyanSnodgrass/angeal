class AddSelfJoinToGoals < ActiveRecord::Migration[5.0]
  def change
    add_reference :goals, :parent, index: true
  end
end
