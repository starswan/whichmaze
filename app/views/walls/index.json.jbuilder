json.array!(@walls) do |wall|
  # json.extract! wall, :id, :maze_id, :xposition, :yposition, :right, :down
  json.extract! wall, :xposition, :yposition, :right, :down
  # json.url maze_wall_url(wall, :maze_id => @maze, :format => :json)
end
