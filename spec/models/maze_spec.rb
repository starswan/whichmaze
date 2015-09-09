require 'rails_helper'

RSpec.describe Maze, :type => :model do
  let(:valid_attributes) {
    { :width => 3, :height => 2 }
  }

  describe "creating a new maze" do
    it "should generate a solvable maze starting from 1,1 with a recognized exit" do
      maze = Maze.create! valid_attributes
      walls = maze.maze_walls
      expect(walls.count).to eq(6)
      maze_exit = walls.find { |wall| wall.xposition == 1 and wall.yposition == 1 }
      expect(maze_exit.xposition).to eq(1)
      expect(maze_exit.yposition).to eq(1)

      maze_hash = walls.inject({}) do |hash, wall|
        hash[[wall.xposition, wall.yposition]] = {:down => wall.down, :right => wall.right}
        hash
      end

      xpos, ypos = 1, 1
      # Try to solve maze, backtracking if the path is a dead end
      solution = [] << [xpos, ypos]
      visited_hash = {}
      visited_hash[[xpos, ypos]] = true
      while visited_hash.size < walls.size and solution.size > 0
        # Need to find an accessible non-visited cell
        neighbours = [[xpos-1, ypos, :right], [xpos+1, ypos, :right], [xpos, ypos-1, :down], [xpos, ypos+1, :down]]
        # Rely on maze_hash only having valid positions e.g. with co-ordinates 1 and above
        non_visited_neighbours = neighbours.reject { |x, y, dir| visited_hash.has_key? [x,y] }
                                           .select { |x, y, dir| x = maze_hash[[x, y]]; x and not x[dir]}
        if non_visited_neighbours.size == 0
          # Back track
          xpos, ypos = solution.pop
        else
          xpos, ypos, direction = non_visited_neighbours[rand(non_visited_neighbours.size)]
          visited_hash[[xpos, ypos]] = true
          solution << [xpos, ypos]
        end
      end
      expect(solution.size).to be > 0
    end
  end
end
