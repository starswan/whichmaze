require 'rails_helper'

RSpec.describe "maze_walls/new", type: :view do
  before(:each) do
    assign(:maze_wall, MazeWall.new(
      :maze_id => 1,
      :xposition => 1,
      :yposition => 1,
      :right => false,
      :down => false
    ))
  end

  it "renders new maze_wall form" do
    render

    assert_select "form[action=?][method=?]", maze_walls_path, "post" do

      assert_select "input#maze_wall_maze_id[name=?]", "maze_wall[maze_id]"

      assert_select "input#maze_wall_xposition[name=?]", "maze_wall[xposition]"

      assert_select "input#maze_wall_yposition[name=?]", "maze_wall[yposition]"

      assert_select "input#maze_wall_right[name=?]", "maze_wall[right]"

      assert_select "input#maze_wall_down[name=?]", "maze_wall[down]"
    end
  end
end
