class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :title, :who, :when, :range
      t.text :what
      t.belongs_to :vision
    end
  end
end
