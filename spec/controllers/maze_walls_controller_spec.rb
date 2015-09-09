require 'rails_helper'

RSpec.describe MazeWallsController, :type => :controller do

  let(:valid_maze_attributes) {
    { :width => 1, :height => 1 }
  }
  let(:valid_wall_attributes) {
    { :xposition => 1, :yposition => 1, :right => true, :down => true }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MazeWallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns generated maze_walls from specific maze as @maze_walls" do
      maze = Maze.create! valid_maze_attributes
      maze_wall = maze.maze_walls.new(valid_wall_attributes)
      get :index, { :maze_id => maze.id }, valid_session
      expect(assigns(:maze_walls).size).to eq(1)
      expect(assigns(:maze_walls)[0].xposition).to eq(maze_wall.xposition)
      expect(assigns(:maze_walls)[0].yposition).to eq(maze_wall.yposition)
      expect(assigns(:maze_walls)[0].right).to eq(maze_wall.right)
      expect(assigns(:maze_walls)[0].down).to eq(maze_wall.down)
    end
  end

end
