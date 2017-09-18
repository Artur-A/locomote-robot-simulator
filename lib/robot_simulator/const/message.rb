require 'ruby-enum'

# A bunch of messages
class Message
  include Ruby::Enum

  # Start
  define :ROBOT_PLACED, 'The robot is on the tabletop'

  # Command
  define :EMPTY_COMMAND, 'empty command'
  define :PLACE_COMMAND_REQUIRED_ARGS, 'X, Y and FACING arguments are required, e.g. `PLACE 0 0 NORTH`'

  def self.place_out_bound(argument, range)
    "`PLACE` is out of boundary, `#{argument}` can be from #{range.min} to #{range.max}"
  end

  # Vector
  define :X_IS_NOT_NUMBER, 'X should be a number'
  define :Y_IS_NOT_NUMBER, 'Y should be a number'
  define :WRONG_FACING, 'FACING argument is incorrect'


end