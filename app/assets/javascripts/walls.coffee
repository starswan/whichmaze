# Emulate the ruby rand() method which returns an integer between 0 and limit - 1
window.rand = (limit) ->
  Math.floor(Math.random() * limit)

print_solution = (solution) ->
  "[X: #{item.x} Y: #{item.y}]" for item in solution

json_failed = (json, status) ->
  alert "Error retrieving maze data"

hash_key = (x, y) ->
  "#{x},#{y}"

point_hash_key = (point) ->
  hash_key(point.x, point.y)

window.maze_solver = (walls, endpoint) ->
  maze_hash = {}
  for wall in walls
    maze_hash[hash_key(wall.x, wall.y)] = { down: wall.down, right: wall.right }

  # Try to solve maze, backtracking if the path is a dead end
  solution = []
  point = { x: 1, y: 1 }
  solution.push point
  visited_set = []
  visited_set[point_hash_key(point)] = true

  neighbours = [{xoffset:-1, yoffset: 0, direction: 'right', xwalloffset:-1, ywalloffset: 0},
                {xoffset: 1, yoffset: 0, direction: 'right', xwalloffset: 0, ywalloffset: 0},
                {xoffset: 0, yoffset:-1, direction: 'down',  xwalloffset: 0, ywalloffset:-1},
                {xoffset: 0, yoffset: 1, direction: 'down',  xwalloffset: 0, ywalloffset: 0}]

  while (point.x != endpoint.x or point.y != endpoint.y) and solution.length > 0
    # Need to find an accessible non-visited cell
    # Rely on maze_hash only having valid positions e.g. with co-ordinates 1 and above
    non_visited_neighbours = []
    for neighbour in neighbours
      newpoint = { x: point.x + neighbour.xoffset, y: point.y + neighbour.yoffset}

      unless visited_set[point_hash_key(newpoint)]
        mh = maze_hash[hash_key(point.x + neighbour.xwalloffset, point.y + neighbour.ywalloffset)]
        if mh and mh[neighbour.direction] == false # We have a path to our neighbour
          non_visited_neighbours.push newpoint

    if non_visited_neighbours.length == 0
      # Back track
      point = solution.pop()
#      alert "Back tracking to #{point.x} #{point.y}"
    else
      point = non_visited_neighbours[rand(non_visited_neighbours.length)]
      visited_set[point_hash_key(point)] = true
      solution.push point
#      alert "Visiting #{point.x} #{point.y} solution now #{print_solution(solution)}"
#  alert print_solution(solution)
  solution

json_received = (json, status) ->
  button = $('#solve')
  xexit = button.data('xexit')
  yexit = button.data('yexit')
  solution = maze_solver(json, { 'x' : xexit, 'y' : yexit })
  alert "Solution #{print_solution(solution)}"

jQuery ->
  button = $('#solve')
  params = { type: 'GET', dataType: 'json', error: json_failed, success: json_received  }
  button.click ->
#    alert 'solve it you silly thing'
    $.ajax('/mazes/' + button.data('maze') + '/walls.json', params)

