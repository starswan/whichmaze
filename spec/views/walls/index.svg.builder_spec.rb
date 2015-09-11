require 'rails_helper'

RSpec.describe "walls/index.svg.builder", type: :view do
  before(:each) do
    assign(:maze, Maze.create!(height: 2, width: 2))
    @walls = assign(:walls, Maze.last.walls)
  end

  it 'renders svg data' do
    render
    # The exact number of walls will depend on the solution...
    # But there will always be at least 2 walls top and left
    wall_count = 2 + @walls.collect { |w| (w.down ? 1 : 0) + (w.right ? 1 : 0) }.sum
    assert_select 'svg>line', :count => wall_count
  end

end