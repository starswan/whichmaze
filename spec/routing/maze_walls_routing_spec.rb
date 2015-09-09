require "rails_helper"

RSpec.describe MazeWallsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mazes/1/maze_walls").to route_to("maze_walls#index", :maze_id => "1")
    end

  end
end
