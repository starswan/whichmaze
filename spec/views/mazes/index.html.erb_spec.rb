require 'rails_helper'

RSpec.describe "mazes/index", :type => :view do
  before(:each) do
    assign(:mazes, [
      Maze.create!(
        :width => 2,
        :height => 3
      ),
      Maze.create!(
        :width => 4,
        :height => 5
      )
    ])
  end

  it "renders a list of mazes" do
    render
    assert_select "tr>td", :text => 2.to_s, :minimum => 1
    assert_select "tr>td", :text => 3.to_s, :minimum => 1
    assert_select "tr>td", :text => 4.to_s, :minimum => 1
    assert_select "tr>td", :text => 5.to_s, :minimum => 1
  end
end
