require 'rails_helper'

RSpec.describe "maze_walls/index", type: :view do
  before(:each) do
    assign(:maze_walls, [
      MazeWall.create!(
        :maze_id => 1,
        :xposition => 2,
        :yposition => 3,
        :right => false,
        :down => false
      ),
      MazeWall.create!(
        :maze_id => 1,
        :xposition => 2,
        :yposition => 3,
        :right => false,
        :down => false
      )
    ])
  end

  it "renders a list of maze_walls" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 4
    assert_select "tr>td", :text => false.to_s, :count => 4
  end
end
