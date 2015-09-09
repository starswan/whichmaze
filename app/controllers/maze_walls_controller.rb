class MazeWallsController < ApplicationController
  before_action :set_maze_wall, only: [:show, :edit, :update, :destroy]

  # GET /maze_walls
  # GET /maze_walls.json
  def index
    @maze_walls = MazeWall.all
  end

  # GET /maze_walls/1
  # GET /maze_walls/1.json
  def show
  end

  # GET /maze_walls/new
  def new
    @maze_wall = MazeWall.new
  end

  # GET /maze_walls/1/edit
  def edit
  end

  # POST /maze_walls
  # POST /maze_walls.json
  def create
    @maze_wall = MazeWall.new(maze_wall_params)

    respond_to do |format|
      if @maze_wall.save
        format.html { redirect_to @maze_wall, notice: 'Maze wall was successfully created.' }
        format.json { render :show, status: :created, location: @maze_wall }
      else
        format.html { render :new }
        format.json { render json: @maze_wall.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maze_walls/1
  # PATCH/PUT /maze_walls/1.json
  def update
    respond_to do |format|
      if @maze_wall.update(maze_wall_params)
        format.html { redirect_to @maze_wall, notice: 'Maze wall was successfully updated.' }
        format.json { render :show, status: :ok, location: @maze_wall }
      else
        format.html { render :edit }
        format.json { render json: @maze_wall.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maze_walls/1
  # DELETE /maze_walls/1.json
  def destroy
    @maze_wall.destroy
    respond_to do |format|
      format.html { redirect_to maze_walls_url, notice: 'Maze wall was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maze_wall
      @maze_wall = MazeWall.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maze_wall_params
      params.require(:maze_wall).permit(:maze_id, :xposition, :yposition, :right, :down)
    end
end
