require 'colorize'
require_relative 'robot_simulator/version'
require_relative 'robot_simulator/game'
require_relative 'robot_simulator/tabletop_size'
require_relative 'robot_simulator/commands/simple_command'
require_relative 'robot_simulator/commands/command_line'
require_relative 'robot_simulator/const/message'
require_relative 'robot_simulator/utils/UI'

module RobotSimulator
  class CLI
    def self.run(ui=RobotSimulator::UI.new)
      size = TabletopSize.new(5,5)
      ui.puts ("Welcome to the game.\n" \
            "The tabletop dimension is #{size.width} x #{size.height}.\n" \
            "Place a robot with the next command:\n" \
            "`PLACE {0-based COORDINATES} {DIRECTION}`, for example, `PLACE 0 0 NORTH`").green

      # Start the game
      game = nil
      while game.nil? && line = ui.gets
        result = Game.init(size, CommandLine.new(line))
        if result.success?
          game = result.value
        else
          ui.puts "Error: #{result.error}".red
        end
      end

      ui.puts ("#{Message::ROBOT_PLACED}.\n" \
           "You can manipulate it. Out of bound movement is ignored.\n" \
           "Available commands:\n" \
           "\t`REPORT` - print current status,\n" \
            "\t`LEFT` - turn counterclockwise,\n" \
            "\t`RIGHT` - turn clockwise,\n" \
            "\t`MOVE` - move one position forward,\n"
           ).green

      # Read and apply robot commands
      while line = ui.gets
        result = SimpleCommand.from_command_line(CommandLine.new(line))
        if result.success?
          case result.value.command
          when Command::LEFT then game.left
          when Command::RIGHT then game.right
          when Command::MOVE then game.move
          when Command::REPORT then ui.puts game.report.green
          else ui.puts 'Error: Unknown command'.red
          end
        else
          ui.puts "Error: #{result.error}".red
        end
      end
    end
  end
end
