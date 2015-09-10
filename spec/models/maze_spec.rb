require 'rails_helper'

RSpec.describe Maze, :type => :model do
  let(:valid_attributes) {
    { :width => 3, :height => 3 }
  }

  describe "creating a new maze" do
    it "should generate a solvable maze starting from 1,1 with a recognized exit" do
      maze = Maze.create! valid_attributes
      walls = maze.walls
      expect(walls.count).to eq(9)
      maze_exit = walls.find { |wall| wall.xposition == 1 and wall.yposition == 1 }
      expect(maze_exit.xposition).to eq(1)
      expect(maze_exit.yposition).to eq(1)

      expect(walls.select { |w| not w.down or not w.right }.size).to be > 0
      # expect(walls.select { |w| not w.down or not w.right }.size).to eq(5)
      # expect(walls).to eq([])

      maze_hash = walls.inject({}) do |hash, wall|
        hash[[wall.xposition, wall.yposition]] = {:down => wall.down, :right => wall.right}
        hash
      end

      xpos, ypos = 1, 1
      # Try to solve maze, backtracking if the path is a dead end
      solution = [] << [xpos, ypos]
      visited_set = Set.new [[xpos, ypos]]
      neighbours = [[-1, 0, :right, -1, 0], [1, 0, :right, 0, 0], [0, -1, :down, 0, -1], [0, 1, :down, 0, 0]]
      while visited_set.size < walls.size and solution.size > 0
        # Need to find an accessible non-visited cell
        # Rely on maze_hash only having valid positions e.g. with co-ordinates 1 and above
        non_visited_neighbours = neighbours.reject do |x, y|
          visited_set.include? [xpos + x,ypos + y]
        end.select { |x, y, dir, xo, yo| mh = maze_hash[[xpos + xo, ypos + yo]]; mh and not mh[dir]}

        if non_visited_neighbours.size == 0
          # Back track
          xpos, ypos = solution.pop
        else
          xoffset, yoffset = non_visited_neighbours[rand(non_visited_neighbours.size)]
          xpos, ypos = xpos + xoffset, ypos + yoffset
          visited_set << [xpos, ypos]
          solution << [xpos, ypos]
        end
      end
      expect(solution.size).to be > 0
    end
  end
end
