require 'test_helper'

class MazeWallsControllerTest < ActionController::TestCase
  setup do
    @maze_wall = maze_walls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:maze_walls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create maze_wall" do
    assert_difference('MazeWall.count') do
      post :create, maze_wall: { down: @maze_wall.down, maze_id: @maze_wall.maze_id, right: @maze_wall.right, xposition: @maze_wall.xposition, yposition: @maze_wall.yposition }
    end

    assert_redirected_to maze_wall_path(assigns(:maze_wall))
  end

  test "should show maze_wall" do
    get :show, id: @maze_wall
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @maze_wall
    assert_response :success
  end

  test "should update maze_wall" do
    patch :update, id: @maze_wall, maze_wall: { down: @maze_wall.down, maze_id: @maze_wall.maze_id, right: @maze_wall.right, xposition: @maze_wall.xposition, yposition: @maze_wall.yposition }
    assert_redirected_to maze_wall_path(assigns(:maze_wall))
  end

  test "should destroy maze_wall" do
    assert_difference('MazeWall.count', -1) do
      delete :destroy, id: @maze_wall
    end

    assert_redirected_to maze_walls_path
  end
end
