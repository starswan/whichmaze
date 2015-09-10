class CreateMazeWalls < ActiveRecord::Migration
  def change
    create_table :walls do |t|
      t.integer :maze_id
      t.integer :x
      t.integer :y
      t.boolean :right
      t.boolean :down

      t.timestamps :null => false
    end
  end
end
