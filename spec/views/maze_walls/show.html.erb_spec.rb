require 'rails_helper'

RSpec.describe "maze_walls/show", type: :view do
  before(:each) do
    @maze_wall = assign(:maze_wall, MazeWall.create!(
      :maze_id => 1,
      :xposition => 2,
      :yposition => 3,
      :right => false,
      :down => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
