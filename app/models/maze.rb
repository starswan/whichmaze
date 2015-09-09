class Maze < ActiveRecord::Base
  validates :height, :numericality => { :greater_than => 0 }
  validates :width, :numericality => { :greater_than => 0 }

  has_many :maze_walls, :dependent => :destroy
end
