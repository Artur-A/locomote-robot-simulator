require_relative '../utils/result'
require_relative '../const/message'
require_relative '../utils/string'
require_relative '../const/facing'
require_relative './simple_command'
require_relative '../robot_vector'

# A command to place the robot on the tabletop
class PlaceCommand
  attr_reader :command, :vector

  def initialize(command, vector)
    @command = command
    @vector = vector
  end

  private_class_method :new

  # Creates PlaceCommand from a command line
  def self.from_command_line(command_line)
    return Result.new(nil, Message::EMPTY_COMMAND) if command_line.command.nil?
    return Result.new(nil, Message::PLACE_COMMAND_REQUIRED_ARGS) if command_line.arguments.length < 3

    x = command_line.arguments[0].to_i_or_nil
    return Result.new(nil, Message::X_IS_NOT_NUMBER) if x.nil?

    y = command_line.arguments[1].to_i_or_nil
    return Result.new(nil, Message::Y_IS_NOT_NUMBER) if y.nil?

    facing = command_line.arguments[2]

    begin
      vector = RobotVector.new(x, y, facing)
      Result.new(new(command_line.command, vector))
    rescue ArgumentError => e
      return Result.new(nil, e.message)
    end
  end

end
