require 'rails_helper'

RSpec.describe "walls/index.svg.builder", type: :view do
  before(:each) do
    assign(:maze, Maze.create!(height: 2, width: 2))
    assign(:walls, Maze.last.walls)
  end

  it 'renders svg data' do
    render
    # The exact number of walls will depend on the solution...
    assert_select 'svg>line', :minimum => 2
  end

end