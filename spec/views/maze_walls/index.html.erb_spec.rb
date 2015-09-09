require 'rails_helper'

RSpec.describe "maze_walls/index", :type => :view do
  before(:each) do
    assign(:maze, Maze.create!(:height => 3, :width => 2))
    maze = Maze.first
    assign(:maze_walls, [
      maze.maze_walls.create!(
        # :maze_id => 1,
        :xposition => 1,
        :yposition => 2,
        :right => false,
        :down => false
      ),
      maze.maze_walls.create!(
        # :maze_id => 1,
        :xposition => 2,
        :yposition => 3,
        :right => false,
        :down => false
      )
    ])
  end

  it "renders a list of maze_walls" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 1
    assert_select "tr>td", :text => false.to_s, :count => 4
    assert_select "tr>td", :text => false.to_s, :count => 4
  end
end
