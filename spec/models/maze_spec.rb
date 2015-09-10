require 'rails_helper'

MAZE_SIZE = 4

RSpec.describe Maze, :type => :model do
  let(:valid_attributes) {
    { :width => MAZE_SIZE, :height => MAZE_SIZE }
  }

  describe "creating an invalid maze should fail" do
    it "should not allow zero or negative height values" do
      maze = Maze.new valid_attributes.merge(:height => 0)
      expect(maze.save).to be(false)
      maze2 = Maze.new valid_attributes.merge(:height => -1)
      expect(maze2.save).to be(false)
    end
    it "should not allow height values above 100" do
      maze = Maze.new valid_attributes.merge(:height => 101)
      expect(maze.save).to be(false)
    end

    it "should not allow zero or negative width values" do
      maze = Maze.new valid_attributes.merge(:width => 0)
      expect(maze.save).to be(false)
      maze2 = Maze.new valid_attributes.merge(:width => -1)
      expect(maze2.save).to be(false)
    end
    it "should not allow width values above 100" do
      maze = Maze.new valid_attributes.merge(:width => 101)
      expect(maze.save).to be(false)
    end
  end

  describe "creating a new maze" do
    it "should generate a solvable maze starting from 1,1 with a recognized exit" do
      maze = Maze.create! valid_attributes
      walls = maze.walls
      expect(walls.count).to eq(MAZE_SIZE * MAZE_SIZE)
      maze_start = walls.find { |wall| wall.x == 1 and wall.y == 1 }
      expect(maze_start.x).to eq(1)
      expect(maze_start.y).to eq(1)

      # Must have some paths rather than all walls
      expect(walls.select { |w| not w.down or not w.right }.size).to be > 0

      # xexit, yexit should always be a point on the edge of the maze which isn't 1,1
      # so valid for the 4x4 is anything apart from the 4 middle cells and 1,1 at top left
      # So the max is either 4 or the min is 1.
      expect(maze.xexit + maze.yexit).to be > 2

      # Make first, second a pair where first <= second
      first,second = maze.xexit, maze.yexit
      first,second = second, first if first > second
      # If the largest is not on the edge then the smallest must be
      if second != MAZE_SIZE
        expect(first).to eq(1)
      end
      # If first is non on the edge then the second must be the edge
      if first != 1
        expect(second).to eq(MAZE_SIZE)
      end
      max_exit = [maze.xexit, maze.yexit].max
      min_exit = [maze.xexit, maze.yexit].min
      # # expect(max_exit).to eq(valid_attributes[:height])

      maze_hash = walls.inject({}) do |hash, wall|
        hash[[wall.x, wall.y]] = {:down => wall.down, :right => wall.right}
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
