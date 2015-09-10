class Maze < ActiveRecord::Base
  validates :height, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }
  validates :width, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }

  has_many :walls, :dependent => :destroy

  before_create :add_walls

  WallData = Struct.new :down, :right
  Point = Struct.new :x, :y

  def add_walls
    mazewalls = {}
    1.upto(self.height) do |yposition|
      1.upto(self.width) do |xposition|
        mazewalls[Point.new(xposition, yposition)] = WallData.new(true, true)
      end
    end
    point = Point.new 1, 1
    visited_cells = Set.new [point]
    cellstack = []
    xexit, yexit, pathsize = 0, 0, 0
    while visited_cells.size < mazewalls.size
      potential_neighbours = [Point.new(point.x-1, point.y),
                              Point.new(point.x+1, point.y),
                              Point.new(point.x, point.y-1),
                              Point.new(point.x, point.y+1)]

      unvisited_neighbours = potential_neighbours.reject do |p|
        p.x < 1 or p.y < 1 or p.x > self.width or p.y > self.height
      end.reject { |p| visited_cells.include? p }

      if unvisited_neighbours.size == 0
        if cellstack.size > pathsize
          pathsize = cellstack.size
          xexit, yexit = point.x, point.y
        end
        point = cellstack.pop
      else
        cellstack << point
        newpoint = unvisited_neighbours[rand(unvisited_neighbours.size)]
        # Remove wall between current and chosen
        if newpoint.x != point.x
          # need to remove a right wall (ypos === newy)
          if newpoint.x < point.x
            # remove newx
            mazewalls[Point.new(newpoint.x, point.y)].right = false
          else
            # remove xpos
            mazewalls[Point.new(point.x, point.y)].right = false
          end
        else
          # need to remove a down wall (xpos === newx)
          if newpoint.y < point.y
            # remove newy
            mazewalls[Point.new(point.x, newpoint.y)].down = false
          else
            # remove ypos
            mazewalls[Point.new(point.x, point.y)].down = false
          end
        end
        point = newpoint
        visited_cells << point
      end
    end
    mazewalls.each { |point, wall| self.walls.build :x => point.x, :y => point.y,
                                                    :down => wall.down, :right => wall.right }
    self.xexit = xexit
    self.yexit = yexit
    logger.debug "Maze now #{self.inspect} #{xexit} #{yexit}"
    true
  end
end
