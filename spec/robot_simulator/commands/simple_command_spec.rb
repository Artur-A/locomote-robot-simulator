require 'robot_simulator/commands/simple_command'
require 'robot_simulator/commands/command_line'

RSpec.describe SimpleCommand do
  it 'fails empty line' do
    result = SimpleCommand.from_command_line(CommandLine.new(' '))
    raise if result.success?

    expect(result.error).to eq(Message::EMPTY_COMMAND)
  end

  it 'has an argument' do
    result = SimpleCommand.from_command_line(CommandLine.new('MOVE'))
    raise unless result.success?
    expect(result.value.command).to eq('MOVE')
  end

end
