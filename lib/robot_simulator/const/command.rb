# A list of supported commands
class Command
  include Ruby::Enum

  define :PLACE, 'PLACE'
  define :MOVE, 'MOVE'
  define :LEFT, 'LEFT'
  define :RIGHT, 'RIGHT'
  define :REPORT, 'REPORT'
end
