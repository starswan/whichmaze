json.array!(@mazes) do |maze|
  json.extract! maze, :id, :height, :width
  json.url maze_url(maze, format: :json)
end
