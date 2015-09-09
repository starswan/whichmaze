require 'rails_helper'

RSpec.describe "mazes/edit", type: :view do
  before(:each) do
    @maze = assign(:maze, Maze.create!(
      :width => 1,
      :height => 1
    ))
  end

  it "renders the edit maze form" do
    render

    assert_select "form[action=?][method=?]", maze_path(@maze), "post" do

      assert_select "input#maze_width[name=?]", "maze[width]"

      assert_select "input#maze_height[name=?]", "maze[height]"
    end
  end
end
