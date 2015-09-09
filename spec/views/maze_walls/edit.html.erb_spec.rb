require 'rails_helper'

RSpec.describe "maze_walls/edit", type: :view do
  before(:each) do
    @maze_wall = assign(:maze_wall, MazeWall.create!(
      :maze_id => 1,
      :xposition => 1,
      :yposition => 1,
      :right => false,
      :down => false
    ))
  end

  it "renders the edit maze_wall form" do
    render

    assert_select "form[action=?][method=?]", maze_wall_path(@maze_wall), "post" do

      assert_select "input#maze_wall_maze_id[name=?]", "maze_wall[maze_id]"

      assert_select "input#maze_wall_xposition[name=?]", "maze_wall[xposition]"

      assert_select "input#maze_wall_yposition[name=?]", "maze_wall[yposition]"

      assert_select "input#maze_wall_right[name=?]", "maze_wall[right]"

      assert_select "input#maze_wall_down[name=?]", "maze_wall[down]"
    end
  end
end
