class MazesController < ApplicationController
  before_action :set_maze, :only => [:show, :destroy]

  # GET /mazes
  # GET /mazes.json
  def index
    @mazes = Maze.all
  end

  # GET /mazes/1
  # GET /mazes/1.json
  def show
  end

  # GET /mazes/new
  def new
    @maze = Maze.new
  end

  # POST /mazes
  # POST /mazes.json
  def create
    @maze = Maze.new(maze_params)

    respond_to do |format|
      if @maze.save
        format.html { redirect_to maze_walls_path(@maze), :notice => 'Maze was successfully created.' }
        format.json { render :show, :status => :created, :location => @maze }
      else
        format.html { render :new }
        format.json { render :json => @maze.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mazes/1
  # DELETE /mazes/1.json
  def destroy
    @maze.destroy
    respond_to do |format|
      format.html { redirect_to mazes_url, :notice => 'Maze was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maze
      @maze = Maze.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maze_params
      params.require(:maze).permit(:width, :height)
    end
end
