require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe MazeWallsController, :type => :controller do

  let(:valid_maze_attributes) {
    { :width => 1, :height => 2 }
  }
  let(:valid_wall_attributes) {
    { :xposition => 1, :yposition => 2, :right => false, :down => false }
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MazeWallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns maze_walls from specific maze as @maze_walls" do
      maze = Maze.create! valid_maze_attributes
      maze_wall = maze.maze_walls.create!(valid_wall_attributes)
      get :index, { :maze_id => maze.id }, valid_session
      expect(assigns(:maze_walls)).to eq([maze_wall])
    end
  end

end
