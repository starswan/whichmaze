require 'rails_helper'

RSpec.describe "walls/index", :type => :view do
  before(:each) do
    assign(:maze, Maze.create!(:height => 3, :width => 2))
    maze = Maze.first
    assign(:walls, [
      maze.walls.create!(
        # :maze_id => 1,
        :right => false,
        :xposition => 1,
        :yposition => 2,
        :down => false
      ),
      maze.walls.create!(
        # :maze_id => 1,
        :right => false,
        :xposition => 2,
        :yposition => 3,
        :down => false
      )
    ])
  end

  it "renders a list of walls" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 1
    assert_select "tr>td", :text => false.to_s, :count => 4
    assert_select "tr>td", :text => false.to_s, :count => 4
  end
end
