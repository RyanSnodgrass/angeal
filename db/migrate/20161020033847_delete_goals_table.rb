class DeleteGoalsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :goals_tables
    create_table :goals do |t|
      t.string :title, :who, :when, :range
      t.text :what
      t.belongs_to :goals, index: true
    end
  end
end
