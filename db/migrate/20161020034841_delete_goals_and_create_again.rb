class DeleteGoalsAndCreateAgain < ActiveRecord::Migration[5.0]
  def change
    drop_table :goals
    create_table :goals do |t|
      t.string :title, :who, :when, :range
      t.text :what
      t.belongs_to :visions
    end
  end
end
