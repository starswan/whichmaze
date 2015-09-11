class WallsController < ApplicationController
  before_action :set_maze, :only => [:index]

  # GET /mazes/:maze_id/maze_walls
  # GET /mazes/:maze_idmaze_walls.json
  def index
    @walls = @maze.walls
  end

private
  def set_maze
    @maze = Maze.find(params[:maze_id])
  end
end
