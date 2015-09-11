#
# DB representation of wall of maze
# Stores position(x,y) and down/right
# booleans for wall(true) and path(false)
# Top and left of maze is assumed to be solid
class Wall < ActiveRecord::Base
  belongs_to :maze
end
