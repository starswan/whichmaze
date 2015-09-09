require 'rails_helper'

RSpec.describe "mazes/show", type: :view do
  before(:each) do
    @maze = assign(:maze, Maze.create!(
      :width => 1,
      :height => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
