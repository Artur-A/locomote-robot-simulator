# A parsed user's command line: a command(string) and its arguments(string[])
# If there is no command, `nil` is set for the `command`
# If there is no arguments, empty array is set for the `arguments` field
class CommandLine
  attr_reader :command, :arguments

  def initialize(line)
    words = line.strip.split
    @command = words[0]
    @arguments = words.drop(1)
  end
end