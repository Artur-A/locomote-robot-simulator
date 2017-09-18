require 'robot_simulator/commands/place_command'
require 'robot_simulator/commands/command_line'

RSpec.describe PlaceCommand do
  it 'fails empty line' do
    result = PlaceCommand.from_command_line(CommandLine.new(' '))
    raise if result.success?

    expect(result.error).to eq(Message::EMPTY_COMMAND)
  end

  it 'fails first non `PLACE` keyword' do
    result = PlaceCommand.from_command_line(CommandLine.new('WRONG_PLACE_COMMAND'))
    raise if result.success?
    expect(result.error).to eq(Message::PLACE_COMMAND_REQUIRED_ARGS)
  end

  it 'has `X` argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE'))
    raise if result.success?
    expect(result.error).to eq(Message::PLACE_COMMAND_REQUIRED_ARGS)
  end

  it 'has `Y` argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE 1'))
    raise if result.success?
    expect(result.error).to eq(Message::PLACE_COMMAND_REQUIRED_ARGS)
  end

  it 'has `PLACE` argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE 0 0'))
    raise if result.success?
    expect(result.error).to eq(Message::PLACE_COMMAND_REQUIRED_ARGS)
  end

  it 'fails non integer `X` argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE A 2 NORTH'))
    raise if result.success?
    expect(result.error).to eq(Message::X_IS_NOT_NUMBER)
  end

  it 'fails non integer `Y` argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE 0 B NORTH'))
    raise if result.success?
    expect(result.error).to eq(Message::Y_IS_NOT_NUMBER)
  end

  it 'fails wrong `FACING` argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE 0 0 MOON'))
    raise if result.success?
    expect(result.error).to eq(Message::WRONG_FACING)
  end

  it 'has vector argument' do
    result = PlaceCommand.from_command_line(CommandLine.new('PLACE 1 5 SOUTH'))
    raise unless result.success?
    expect(result.value.vector.x).to eq(1)
    expect(result.value.vector.y).to eq(5)
    expect(result.value.vector.facing).to eq(:SOUTH)
  end
end
