require "rails_helper"

RSpec.describe WallsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mazes/1/walls").to route_to("walls#index", :maze_id => "1")
    end

  end
end
