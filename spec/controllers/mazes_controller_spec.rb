require 'rails_helper'

RSpec.describe MazesController, :type => :controller do

  # This should return the minimal set of attributes required to create a valid
  # Maze. As you add validations to Maze, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { :width => 2, :height => 2 }
  }

  let(:invalid_attributes) {
    { :width => 0, :height => -1 }
  }

  describe "GET #index" do
    it "assigns all mazes as @mazes" do
      maze = Maze.create! valid_attributes
      get :index
      expect(assigns(:mazes)).to eq([maze])
    end
  end

  describe "GET #show" do
    it "assigns the requested maze as @maze" do
      maze = Maze.create! valid_attributes
      get :show, params: {:id => maze.to_param}
      expect(assigns(:maze)).to eq(maze)
    end
  end

  describe "GET #new" do
    it "assigns a new maze as @maze" do
      get :new
      expect(assigns(:maze)).to be_a_new(Maze)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Maze" do
        expect {
          post :create, params: {:maze => valid_attributes}
        }.to change(Maze, :count).by(1)
      end

      it "assigns a newly created maze as @maze" do
        post :create, params: {:maze => valid_attributes}
        expect(assigns(:maze)).to be_a(Maze)
        expect(assigns(:maze)).to be_persisted
      end

      it "redirects to the created maze" do
        post :create, params: {:maze => valid_attributes}
        expect(response).to redirect_to(maze_walls_path(Maze.last))
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved maze as @maze" do
        post :create, params: {:maze => invalid_attributes}
        expect(assigns(:maze)).to be_a_new(Maze)
      end

      it "re-renders the 'new' template" do
        post :create, params: {:maze => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested maze" do
      maze = Maze.create! valid_attributes
      expect {
        delete :destroy, params: {:id => maze.to_param}
      }.to change(Maze, :count).by(-1)
    end

    it "redirects to the mazes list" do
      maze = Maze.create! valid_attributes
      delete :destroy, params: {:id => maze.to_param}
      expect(response).to redirect_to(mazes_url)
    end
  end
end
