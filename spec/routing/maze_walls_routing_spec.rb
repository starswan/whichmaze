require "rails_helper"

RSpec.describe MazeWallsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/maze_walls").to route_to("maze_walls#index")
    end

    it "routes to #new" do
      expect(:get => "/maze_walls/new").to route_to("maze_walls#new")
    end

    it "routes to #show" do
      expect(:get => "/maze_walls/1").to route_to("maze_walls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/maze_walls/1/edit").to route_to("maze_walls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/maze_walls").to route_to("maze_walls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/maze_walls/1").to route_to("maze_walls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/maze_walls/1").to route_to("maze_walls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/maze_walls/1").to route_to("maze_walls#destroy", :id => "1")
    end

  end
end
