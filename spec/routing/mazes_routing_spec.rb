require "rails_helper"

RSpec.describe MazesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/mazes").to route_to("mazes#index")
    end

    it "routes to #new" do
      expect(:get => "/mazes/new").to route_to("mazes#new")
    end

    it "routes to #show" do
      expect(:get => "/mazes/1").to route_to("mazes#show", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/mazes").to route_to("mazes#create")
    end

    it "routes to #destroy" do
      expect(:delete => "/mazes/1").to route_to("mazes#destroy", :id => "1")
    end

  end
end
