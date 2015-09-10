describe "rand", ->
  it "will return a value between 0 and limit-1", ->
    expect(rand(1)).toEqual(0)
describe "maze solver", ->
#  it "solves a trival 1x1 maze", ->
#    expect(maze_solver([{'xposition':1, 'yposition':1, 'right':true, 'down':true}]).length).toEqual(1)
  it "solves a 2x1 maze", ->
    expect(maze_solver([{'x':1, 'y':1,'right':false,'down':true},
                        {'x':2, 'y':1,'right':true, 'down':true}], {'x':2, 'y':1}).length).toEqual(2)
  it "solves a 1x2 maze", ->
    expect(maze_solver([{'x':1, 'y':1,'right':true,'down':false},
                        {'x':1, 'y':2,'right':true, 'down':true}], {'x':1, 'y':2}).length).toEqual(2)
