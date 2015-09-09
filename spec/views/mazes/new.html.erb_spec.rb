require 'rails_helper'

RSpec.describe "mazes/new", type: :view do
  before(:each) do
    assign(:maze, Maze.new(
      :width => 1,
      :height => 1
    ))
  end

  it "renders new maze form" do
    render

    assert_select "form[action=?][method=?]", mazes_path, "post" do

      assert_select "input#maze_width[name=?]", "maze[width]"

      assert_select "input#maze_height[name=?]", "maze[height]"
    end
  end
end
