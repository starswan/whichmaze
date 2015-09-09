class CreateMazeWalls < ActiveRecord::Migration
  def change
    create_table :maze_walls do |t|
      t.integer :maze_id
      t.boolean :right
      t.boolean :down
      t.integer :xposition
      t.integer :yposition

      t.timestamps null: false
    end
  end
end
