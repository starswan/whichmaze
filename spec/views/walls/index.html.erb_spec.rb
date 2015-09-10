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

  it 'renders a list of walls' do
    render
    assert_select 'img', :count => 1
  end
end
