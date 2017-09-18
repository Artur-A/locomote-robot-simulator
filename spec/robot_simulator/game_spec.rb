require 'robot_simulator/game'
require 'robot_simulator/tabletop_size'
require 'robot_simulator/commands/command_line'

RSpec.describe Game do
  it 'has the tabletop size after placing a robot' do
    result = Game.init(TabletopSize.new(5,10), CommandLine.new('PLACE 1 2 NORTH'))
    raise unless result.success?
    game = result.value
    expect(game.tabletop_size.width).to eq(5)
    expect(game.tabletop_size.height).to eq(10)
  end

  it 'has a robot vector after placing a robot' do
    result = Game.init(TabletopSize.new(5,10), CommandLine.new('PLACE 1 2 NORTH'))
    raise unless result.success?
    game = result.value
    expect(game.vector.x).to eq(1)
    expect(game.vector.y).to eq(2)
    expect(game.vector.facing.to_sym).to eq(:NORTH)
  end

  it 'fails to place a robot out of boundaries' do
    result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 5 5 NORTH'))
    raise if result.success?
  end

  describe 'has action that' do
    it 'turns LEFT' do
      result = Game.init(TabletopSize.new(5,10), CommandLine.new('PLACE 1 2 NORTH'))
      raise unless result.success?
      game = result.value
      game.left
      expect(game.vector.x).to eq(1)
      expect(game.vector.y).to eq(2)
      expect(game.vector.facing).to eq(:WEST)
    end

    it 'turns RIGHT' do
      result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 4 4 EAST'))
      raise unless result.success?
      game = result.value
      game.right
      expect(game.vector.x).to eq(4)
      expect(game.vector.y).to eq(4)
      expect(game.vector.facing).to eq(:SOUTH)
    end

    it 'moves EAST by X' do
      result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 0 0 EAST'))
      raise unless result.success?
      game = result.value
      game.move
      expect(game.vector.x).to eq(1)
      expect(game.vector.y).to eq(0)
      expect(game.vector.facing).to eq(:EAST)
    end

    it 'moves NORTH by Y' do
      result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 0 0 NORTH'))
      raise unless result.success?
      game = result.value
      game.move
      expect(game.vector.x).to eq(0)
      expect(game.vector.y).to eq(1)
      expect(game.vector.facing).to eq(:NORTH)
    end
  end

  it 'does not move WEST out of boundaries' do
    result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 0 0 WEST'))
    raise unless result.success?
    game = result.value
    game.move
    expect(game.vector.x).to eq(0)
    expect(game.vector.y).to eq(0)
  end

  it 'does not move NORTH out of boundaries' do
    result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 4 4 NORTH'))
    raise unless result.success?
    game = result.value
    game.move
    expect(game.vector.x).to eq(4)
    expect(game.vector.y).to eq(4)
  end

  it 'does not move EAST out of boundaries' do
    result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 4 4 EAST'))
    raise unless result.success?
    game = result.value
    game.move
    expect(game.vector.x).to eq(4)
    expect(game.vector.y).to eq(4)
  end

  it 'does not move SOUTH out of boundaries' do
    result = Game.init(TabletopSize.new(5,5), CommandLine.new('PLACE 0 0 SOUTH'))
    raise unless result.success?
    game = result.value
    game.move
    expect(game.vector.x).to eq(0)
    expect(game.vector.y).to eq(0)
  end
end