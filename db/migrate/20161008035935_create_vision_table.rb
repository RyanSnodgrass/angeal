class CreateVisionTable < ActiveRecord::Migration[5.0]
  def change
    create_table :visions do |t|
      t.string :blurb
    end
    create_table :range_goals do |t|
      t.string :title, :who, :when, :range
      t.text :what
    end
  end
end
