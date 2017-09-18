require 'robot_simulator/commands/command_line'

RSpec.describe CommandLine do
  it 'has a utils' do
    raise unless CommandLine.new('do').command == 'do'
  end

  it 'has an array of arguments' do
    command_line = CommandLine.new('do this and that')
    raise unless command_line.command == 'do'
    expect(command_line.arguments.length).to eq(3)
    expect(command_line.arguments[0]).to eq('this')
    expect(command_line.arguments[1]).to eq('and')
    expect(command_line.arguments[2]).to eq('that')
  end

  it 'ignores white spaces and new lines' do
    command_line = CommandLine.new("  do      this    and   that       \r\n")
    raise unless command_line.command == 'do'
    expect(command_line.arguments.length).to eq(3)
    expect(command_line.arguments[0]).to eq('this')
    expect(command_line.arguments[1]).to eq('and')
    expect(command_line.arguments[2]).to eq('that')
  end

  it 'has nil utils and empty array arguments
      when line is white-spaced string' do
    command_line = CommandLine.new('      ')
    raise unless command_line.command.nil?
    raise if command_line.arguments.any?
  end
end