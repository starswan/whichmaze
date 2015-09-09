json.array!(@maze_walls) do |maze_wall|
  json.extract! maze_wall, :id, :maze_id, :xposition, :yposition, :right, :down
  json.url maze_wall_url(maze_wall, format: :json)
end
