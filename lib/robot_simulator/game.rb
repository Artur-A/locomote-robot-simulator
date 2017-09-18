require_relative('./utils/result')
require_relative('./const/message')
require_relative('./const/command')
require_relative('./const/facing')
require_relative('./robot_vector')
require_relative('./commands/place_command')

# A game with dynamic dimension
class Game
  attr_reader :tabletop_size, :vector

  def initialize(tabletop_size, vector)
    @tabletop_size = tabletop_size
    @vector = vector
  end

  def left
    @vector = @vector.turn(-1)
  end

  def right
    @vector = @vector.turn(1)
  end

  def report
    @vector.to_s
  end

  def move
    new_vector = @vector.move(1)
    @vector = new_vector if tabletop_size.include?(new_vector.x, new_vector.y)
  end

  private_class_method :new

  # Initializes Game object
  # Returns result of the operation (success/error)
  def self.init(tabletop_size, command_line)
    result = PlaceCommand.from_command_line(command_line)
    return result unless result.success?

    place_command = result.value
    return Result.new(nil, Message.place_out_bound('X', tabletop_size.range_x)) unless tabletop_size.range_x.include?(place_command.vector.x)
    return Result.new(nil, Message.place_out_bound('Y', tabletop_size.range_y)) unless tabletop_size.range_y.include?(place_command.vector.y)

    Result.new(new(tabletop_size, place_command.vector))
  end

end