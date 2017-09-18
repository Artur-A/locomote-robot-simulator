module RobotSimulator
  # Console UI
  # Moved to separate class for simple mocking
  class UI
    def puts(message)
      $stdout.puts message
    end

    def gets
      $stdin.gets
    end
  end
end