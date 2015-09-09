class CreateMazes < ActiveRecord::Migration
  def change
    create_table :mazes do |t|
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end
