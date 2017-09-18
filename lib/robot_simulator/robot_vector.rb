require_relative './const/facing'
require_relative './utils/result'
require_relative './const/message'
require_relative './utils/string'

# A vector showing the direction and the position of the robot
class RobotVector
  attr_reader :x, :y, :facing

  # Create new instance
  # If x or y is not a number, the error will be raised
  # If facing is incorrect, the error will be raised
  def initialize(x, y, facing)
    # invariants
    raise ArgumentError, Message::WRONG_FACING unless Facing.keys.include? facing.to_sym

    @x = x
    @y = y
    @facing = facing.to_sym
  end

  # Turn robot on -1, -2, -3 steps (counterclockwise)
  # or +1, +2, +3 steps (clockwise)
  #
  # Immutable operation, returns new RobotVector object
  def turn(step)
    result_index = ((Facing.keys.index(@facing.to_sym) || 0) + step) % Facing.keys.length
    RobotVector.new(@x, @y, Facing.keys[result_index].to_sym)
  end

  # Moves vector on a step
  #
  # Immutable operation, returns new RobotVector object
  def move(step)
    raise ArgumentError 'step should be a positive number' unless step > 0

    x = @x
    y = @y
    case @facing.to_s
      when Facing::EAST then x = @x + step
      when Facing::WEST then x = @x - step
      when Facing::NORTH then y = @y + step
      when Facing::SOUTH then y = @y - step
    end

    RobotVector.new(x, y, @facing)
  end

  def to_s
    "x: #{@x}, y: #{@y}, facing: #{@facing}"
  end
end