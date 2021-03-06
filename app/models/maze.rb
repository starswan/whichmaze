#
# Maze creates walls when it is saved to the db.
# walls are numbered from 1 to width (x) and 1 to height (y)
# The entrance cell is always assumed to be cell 1,1
class Maze < ActiveRecord::Base
  validates :height, :numericality => { greater_than: 1, less_than_or_equal_to: 100 }
  validates :width, :numericality => { greater_than: 1, less_than_or_equal_to: 100 }

  has_many :walls, dependent: :destroy

  before_create :add_walls

  WallData = Struct.new :down, :right
  Point = Struct.new :x, :y

  START_POINT = Point.new(1, 1)

  # Generate walls for maze using backtracking algorithm
  # https://en.wikipedia.org/wiki/Maze_generation_algorithm#Recursive_backtracker
  def add_walls
    # Make a hash with all walls and no paths as a starting point
    mazewalls = {}
    1.upto(self.height) do |yposition|
      1.upto(self.width) do |xposition|
        mazewalls[Point.new(xposition, yposition)] = WallData.new(true, true)
      end
    end
    current_point = START_POINT
    visited_cells = Set.new [current_point]
    current_path = [current_point]
    exit_point, solution_path_size = current_point, current_path.size
    while visited_cells.size < mazewalls.size
      # Neighbours are on all compass points NSEW - only horizontal moves allowed
      potential_neighbours = [Point.new(current_point.x-1, current_point.y),
                              Point.new(current_point.x+1, current_point.y),
                              Point.new(current_point.x, current_point.y-1),
                              Point.new(current_point.x, current_point.y+1)]

      unvisited_neighbours = potential_neighbours.reject do |p|
        p.x < 1 or p.y < 1 or p.x > self.width or p.y > self.height
      end.reject { |p| visited_cells.include? p }

      if unvisited_neighbours.empty?
        current_point = current_path.pop # Backtrack if we can't make progress
      else
        current_path << current_point

        if current_path.size > solution_path_size and on_edge(current_point) and current_point != START_POINT
          solution_path_size = current_path.size
          exit_point = current_point
        end

        newpoint = unvisited_neighbours[rand(unvisited_neighbours.size)]
        # Remove wall between current and chosen
        if newpoint.x != current_point.x
          # need to remove a right wall (y position === new y position)
          if newpoint.x < current_point.x
            # remove newx
            mazewalls[Point.new(newpoint.x, current_point.y)].right = false
          else
            # remove xpos
            mazewalls[Point.new(current_point.x, current_point.y)].right = false
          end
        else
          # need to remove a down wall (x position === new x position)
          if newpoint.y < current_point.y
            # remove newy
            mazewalls[Point.new(current_point.x, newpoint.y)].down = false
          else
            # remove ypos
            mazewalls[Point.new(current_point.x, current_point.y)].down = false
          end
        end
        current_point = newpoint
        visited_cells << current_point
      end
    end
    mazewalls.each { |point, wall| self.walls.build x: point.x,
                                                    y: point.y,
                                                 down: wall.down,
                                                right: wall.right }
    self.xexit = exit_point.x
    self.yexit = exit_point.y
    true # Make sure that this method doesn't prevent creation of maze
  end

private
  def on_edge point
    point.x == 1 or point.y == 1 or point.x == self.width or point.y == self.height
  end
end
