class MazeWallsController < ApplicationController
  before_action :set_maze, :only => [:index]

  # GET /maze_walls
  # GET /maze_walls.json
  def index
    @maze_walls = @maze.maze_walls
  end

private
  def set_maze
    @maze = Maze.find(params[:maze_id])
  end
end
