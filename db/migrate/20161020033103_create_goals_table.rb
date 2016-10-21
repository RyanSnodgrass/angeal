class CreateGoalsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :goals_tables do |t|
      t.string :title, :who, :when, :range
      t.text :what
      t.belongs_to :goals, index: true
    end
  end
end
