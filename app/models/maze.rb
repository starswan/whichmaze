class Maze < ActiveRecord::Base
  validates :height, :numericality => { :greater_than => 0 }
  validates :width, :numericality => { :greater_than => 0 }

  has_many :maze_walls, :dependent => :destroy

  Wall = Struct.new :down, :right

  after_create do |maze|
    walls = {}
    1.upto(maze.height) do |yposition|
      1.upto(maze.width) do |xposition|
        walls[[xposition, yposition]] = Wall.new(true, true)
      end
    end
    xpos, ypos = 1, 1
    visited_cells = Set.new [[xpos, ypos]]
    cellstack = []
    while visited_cells.size < walls.size
      neighbours = [[xpos-1, ypos], [xpos+1, ypos], [xpos, ypos-1], [xpos, ypos+1]].reject do |x, y|
        x < 1 or y < 1 or x > maze.width or y > maze.height
      end
      unvisited_neighbours = neighbours.reject { |x, y| visited_cells.include? [x, y] }
      if unvisited_neighbours.size == 0
        xpos, ypos = cellstack.pop
      else
        cellstack << [xpos, ypos]
        newx, newy = unvisited_neighbours[rand(unvisited_neighbours.size)]
        # Remove wall between current and chosen
        if newx != xpos
          # need to remove a right wall (ypos === newy)
          if newx < xpos
            # remove newx
            walls[[newx, ypos]].right = false
          else
            # remove xpos
            walls[[xpos, ypos]].right = false
          end
        else
          # need to remove a down wall (xpos === newx)
          if newy < ypos
            # remove newy
            walls[[xpos, newy]].down = false
          else
            # remove ypos
            walls[[xpos, ypos]].down = false
          end
        end
        xpos, ypos = newx, newy
        visited_cells << [xpos, ypos]
      end
    end
    walls.each { |key, data| maze.maze_walls.create! :xposition => key[0], :yposition => key[1],
                                                     :down => data.down, :right => data.right }
  end
end
