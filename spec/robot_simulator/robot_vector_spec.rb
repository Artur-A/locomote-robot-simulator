require('robot_simulator/robot_vector')

RSpec.describe RobotVector do
  it 'has x' do
    expect(RobotVector.new(1, 10, 'NORTH').x).to eq(1)
  end

  it 'has y' do
    expect(RobotVector.new(1, 10, 'NORTH').y).to eq(10)
  end

  it 'has facing' do
    expect(RobotVector.new(1, 10, 'NORTH').facing).to eq(:NORTH)
  end

  it 'turns robot counterclockwise on 1 position from NORTH' do
    expect(RobotVector.new(0,0, 'NORTH').turn(-1).facing).to eq(:WEST)
  end

  it 'turns robot clockwise on 1 position from NORTH' do
    expect(RobotVector.new(0,0, 'NORTH').turn(1).facing).to eq(:EAST)
  end

  it 'turns robot clockwise on 1 position from EAST' do
    expect(RobotVector.new(0,0, 'EAST').turn(1).facing).to eq(:SOUTH)
  end

  it 'moves robot EAST by X' do
    vector = RobotVector.new(0,10, 'EAST').move(1)
    expect(vector.x).to eq(1)
    expect(vector.y).to eq(10)
    expect(vector.facing).to eq(:EAST)
  end

  it 'moves robot WEST by X' do
    vector = RobotVector.new(0,10, 'WEST').move(1)
    expect(vector.x).to eq(-1)
    expect(vector.y).to eq(10)
    expect(vector.facing).to eq(:WEST)
  end

  it 'moves robot NORTH by Y' do
    vector = RobotVector.new(2,5, 'NORTH').move(1)
    expect(vector.x).to eq(2)
    expect(vector.y).to eq(6)
    expect(vector.facing).to eq(:NORTH)
  end

  it 'moves robot SOUTH by Y' do
    vector = RobotVector.new(3,2, 'SOUTH').move(1)
    expect(vector.x).to eq(3)
    expect(vector.y).to eq(1)
    expect(vector.facing).to eq(:SOUTH)
  end

  it 'prints message' do
    expect(RobotVector.new(1,2, 'WEST').to_s).to eq('x: 1, y: 2, facing: WEST')
  end
end
