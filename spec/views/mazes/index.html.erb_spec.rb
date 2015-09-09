require 'rails_helper'

RSpec.describe "mazes/index", :type => :view do
  before(:each) do
    assign(:mazes, [
      Maze.create!(
        :width => 1,
        :height => 2
      ),
      Maze.create!(
        :width => 1,
        :height => 2
      )
    ])
  end

  it "renders a list of mazes" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 3
    assert_select "tr>td", :text => 2.to_s, :count => 3
  end
end
