require_relative '../utils/result'
require_relative '../const/message'

# A command of one word
class SimpleCommand
  attr_reader :command

  def initialize(command)
    @command = command
  end

  private_class_method :new

  # Creates SimpleCommand from a command line
  def self.from_command_line(command_line)
    return Result.new(nil, Message::EMPTY_COMMAND) if command_line.command.nil?

    Result.new(new(command_line.command))
  end
end
