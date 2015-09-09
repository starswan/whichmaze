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

  # This should return the minimal set of attributes required to create a valid
  # MazeWall. As you add validations to MazeWall, be sure to
  # adjust the attributes here as well.
  let(:valid_maze_attributes) {
    # skip("Add a hash of attributes valid for your model")
    { :width => 1, :height => 2 }
  }
  let(:valid_wall_attributes) {
    # skip("Add a hash of attributes valid for your model")
    { :xposition => 1, :yposition => 2, :right => false, :down => false}
  }

  # let(:invalid_attributes) {
  #   skip("Add a hash of attributes invalid for your model")
  # }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MazeWallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all maze_walls as @maze_walls" do
      maze = Maze.create! valid_maze_attributes
      maze_wall = maze.maze_walls.create! valid_wall_attributes
      get :index, {}, valid_session
      expect(assigns(:maze_walls)).to eq([maze_wall])
    end
  end

  # describe "GET #show" do
  #   it "assigns the requested maze_wall as @maze_wall" do
  #     maze_wall = MazeWall.create! valid_attributes
  #     get :show, {:id => maze_wall.to_param}, valid_session
  #     expect(assigns(:maze_wall)).to eq(maze_wall)
  #   end
  # end
  #
  # describe "GET #new" do
  #   it "assigns a new maze_wall as @maze_wall" do
  #     get :new, {}, valid_session
  #     expect(assigns(:maze_wall)).to be_a_new(MazeWall)
  #   end
  # end
  #
  # describe "GET #edit" do
  #   it "assigns the requested maze_wall as @maze_wall" do
  #     maze_wall = MazeWall.create! valid_attributes
  #     get :edit, {:id => maze_wall.to_param}, valid_session
  #     expect(assigns(:maze_wall)).to eq(maze_wall)
  #   end
  # end
  #
  # describe "POST #create" do
  #   context "with valid params" do
  #     it "creates a new MazeWall" do
  #       expect {
  #         post :create, {:maze_wall => valid_attributes}, valid_session
  #       }.to change(MazeWall, :count).by(1)
  #     end
  #
  #     it "assigns a newly created maze_wall as @maze_wall" do
  #       post :create, {:maze_wall => valid_attributes}, valid_session
  #       expect(assigns(:maze_wall)).to be_a(MazeWall)
  #       expect(assigns(:maze_wall)).to be_persisted
  #     end
  #
  #     it "redirects to the created maze_wall" do
  #       post :create, {:maze_wall => valid_attributes}, valid_session
  #       expect(response).to redirect_to(MazeWall.last)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns a newly created but unsaved maze_wall as @maze_wall" do
  #       post :create, {:maze_wall => invalid_attributes}, valid_session
  #       expect(assigns(:maze_wall)).to be_a_new(MazeWall)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       post :create, {:maze_wall => invalid_attributes}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT #update" do
  #   context "with valid params" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }
  #
  #     it "updates the requested maze_wall" do
  #       maze_wall = MazeWall.create! valid_attributes
  #       put :update, {:id => maze_wall.to_param, :maze_wall => new_attributes}, valid_session
  #       maze_wall.reload
  #       skip("Add assertions for updated state")
  #     end
  #
  #     it "assigns the requested maze_wall as @maze_wall" do
  #       maze_wall = MazeWall.create! valid_attributes
  #       put :update, {:id => maze_wall.to_param, :maze_wall => valid_attributes}, valid_session
  #       expect(assigns(:maze_wall)).to eq(maze_wall)
  #     end
  #
  #     it "redirects to the maze_wall" do
  #       maze_wall = MazeWall.create! valid_attributes
  #       put :update, {:id => maze_wall.to_param, :maze_wall => valid_attributes}, valid_session
  #       expect(response).to redirect_to(maze_wall)
  #     end
  #   end
  #
  #   context "with invalid params" do
  #     it "assigns the maze_wall as @maze_wall" do
  #       maze_wall = MazeWall.create! valid_attributes
  #       put :update, {:id => maze_wall.to_param, :maze_wall => invalid_attributes}, valid_session
  #       expect(assigns(:maze_wall)).to eq(maze_wall)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       maze_wall = MazeWall.create! valid_attributes
  #       put :update, {:id => maze_wall.to_param, :maze_wall => invalid_attributes}, valid_session
  #       expect(response).to render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE #destroy" do
  #   it "destroys the requested maze_wall" do
  #     maze_wall = MazeWall.create! valid_attributes
  #     expect {
  #       delete :destroy, {:id => maze_wall.to_param}, valid_session
  #     }.to change(MazeWall, :count).by(-1)
  #   end
  #
  #   it "redirects to the maze_walls list" do
  #     maze_wall = MazeWall.create! valid_attributes
  #     delete :destroy, {:id => maze_wall.to_param}, valid_session
  #     expect(response).to redirect_to(maze_walls_url)
  #   end
  # end

end
