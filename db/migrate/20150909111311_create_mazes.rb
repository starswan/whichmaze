class CreateMazes < ActiveRecord::Migration
  def change
    create_table :mazes do |t|
      t.integer :height
      t.integer :width

      t.timestamps null: false
    end
  end
end
