require 'rails_helper'

RSpec.describe WallsController, :type => :controller do

  let(:valid_maze_attributes) {
    {width: 2, height: 3}
  }
  let(:valid_wall_attributes) {
    {x: 1, y: 1, right: true, down: true}
  }
  before(:each) do
    @maze = Maze.create!(valid_maze_attributes)
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MazeWallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns generated maze_walls from specific maze as @walls" do
      get :index, { :maze_id => @maze.id }, valid_session
      expect(assigns(:walls).size).to eq(6)
    end
  end

end
