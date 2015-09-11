require 'rails_helper'

RSpec.describe "walls/index", type: :view do
  before(:each) do
    assign(:maze, Maze.create!(height: 3, width: 2))
  end

  it 'renders a page with an image of the walls' do
    render
    assert_select 'img[src]', :count => 1
  end

end
