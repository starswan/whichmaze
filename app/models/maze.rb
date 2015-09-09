class Maze < ActiveRecord::Base
  validates :height, :numericality => { :greater_than => 0 }
  validates :width, :numericality => { :greater_than => 0 }

  has_many :maze_walls, :dependent => :destroy

  after_create do |maze|
    logger.debug "After create #{maze.inspect}"
    1.upto(maze.height) do |yposition|
      1.upto(maze.width) do |xposition|
        maze.maze_walls.create! :xposition => xposition, :yposition => yposition, :down => true, :right => true
      end
    end
  end
end
