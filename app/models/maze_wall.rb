class MazeWall < ActiveRecord::Base
  belongs_to :maze

  # validates_presence_of :xposition, :yposition, :down, :right
  validates_presence_of :xposition, :yposition
end
