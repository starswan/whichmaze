require 'rails_helper'

RSpec.describe Maze, :type => :model do
  let(:valid_attributes) {
    { :width => 3, :height => 2 }
  }

  describe "creating a new maze" do
    it "creates width x height walls for each maze" do
      maze = Maze.create! valid_attributes
      expect(maze.maze_walls.count).to eq(6)
    end
  end

end
