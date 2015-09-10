require 'rails_helper'

RSpec.describe "walls/index", :type => :view do
  before(:each) do
    assign(:maze, Maze.create!(:height => 3, :width => 2))
    maze = Maze.first
    assign(:walls, [
      maze.walls.create!(
        :right => false,
        :x => 1,
        :y => 2,
        :down => false
      ),
      maze.walls.create!(
        :right => false,
        :x => 2,
        :y => 3,
        :down => false
      )
    ])
  end

  it 'renders a list of walls' do
    render
    assert_select 'img', :count => 1
  end
end
