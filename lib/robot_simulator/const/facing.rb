require 'ruby-enum'

# A direction that robot faces onto: NORTH, EAST, SOUTH or WEST
class Facing
  include Ruby::Enum

  define :NORTH, 'NORTH'
  define :EAST, 'EAST'
  define :SOUTH, 'SOUTH'
  define :WEST, 'WEST'
end