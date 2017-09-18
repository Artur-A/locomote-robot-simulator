require 'robot_simulator/tabletop_size'
require 'robot_simulator/commands/command_line'

RSpec.describe TabletopSize do
  it 'has width' do
    tabletop_size = TabletopSize.new(6,10)
    expect(tabletop_size.width).to eq(6)
  end

  it 'has height' do
    tabletop = TabletopSize.new(6,10)
    expect(tabletop.height).to eq(10)
  end

  it 'has range_x' do
    tabletop_size = TabletopSize.new(6,10)
    expect(tabletop_size.range_x.min).to eq(0)
    expect(tabletop_size.range_x.max).to eq(5)
  end

  it 'has range_y' do
    tabletop_size = TabletopSize.new(6,10)
    expect(tabletop_size.range_y.min).to eq(0)
    expect(tabletop_size.range_y.max).to eq(9)
  end
end