require 'rails_helper'

RSpec.describe WallsController, :type => :controller do

  let(:valid_maze_attributes) {
    { :width => 1, :height => 1 }
  }
  let(:valid_wall_attributes) {
    { :x => 1, :y => 1, :right => true, :down => true }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MazeWallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns generated maze_walls from specific maze as @walls" do
      maze = Maze.create! valid_maze_attributes
      wall = maze.walls.new(valid_wall_attributes)
      get :index, { :maze_id => maze.id }, valid_session
      expect(assigns(:walls).size).to eq(1)
      expect(assigns(:walls)[0].x).to eq(wall.x)
      expect(assigns(:walls)[0].y).to eq(wall.y)
      expect(assigns(:walls)[0].right).to eq(wall.right)
      expect(assigns(:walls)[0].down).to eq(wall.down)
    end
  end

end
