class CreateMazes < ActiveRecord::Migration
  def change
    create_table :mazes do |t|
      t.integer :width
      t.integer :height
      t.integer :xexit
      t.integer :yexit

      t.timestamps :null => false
    end
  end
end
