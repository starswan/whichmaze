class WallsController < ApplicationController
  before_action :set_maze, :only => [:index]

  # GET /maze_walls
  # GET /maze_walls.json
  def index
    @walls = @maze.walls
  end

private
  def set_maze
    @maze = Maze.find(params[:maze_id])
  end
end
