require 'spec_helper'
require 'robot_simulator'

RSpec.describe RobotSimulator do
  it 'it works' do
    ui = instance_double('RobotSimulator::UI').as_null_object

    allow(ui).to receive(:puts) do |message|
      puts message
    end

    commands = ['PLACE 0 0 NORTH', 'MOVE', 'LEFT', 'RIGHT', 'REPORT']
    allow(ui).to receive(:gets) do
      commands.shift
    end

    RobotSimulator::CLI.run(ui)
  end
end
