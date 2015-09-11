require 'rails_helper'

RSpec.describe WallsController, :type => :controller do

  let(:valid_maze_attributes) {
    { :width => 2, :height => 2 }
  }
  let(:valid_wall_attributes) {
    { :x => 1, :y => 1, :right => true, :down => true }
  }
  before(:each) do
    # @maze = assign(:maze, Maze.create!(
    #                         :width => 2,
    #                         :height => 2
    #                     ))
    @maze = Maze.create!(valid_maze_attributes)
  end


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MazeWallsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns generated maze_walls from specific maze as @walls" do
      get :index, { :maze_id => @maze.id }, valid_session
      expect(assigns(:walls).size).to eq(4)
    end
  end

  describe "GET #index format svg" do
    it "assigns generated maze_walls from specific maze as @walls" do
      get :index, {maze_id: @maze.id, format: :svg}, valid_session
      expect(assigns(:walls).size).to eq(4)
      # puts "response [#{response.public_methods}]"
      # puts "response [#{response.body}]"
      expect(response.content_type).to eq('image/svg+xml')
      expect(response.success?).to eq((true))
      # xml = Nokogiri::XML(response.body)
      # expect(xml.xpath("//svg/line").size).to eq(4)
    end
  end

end
