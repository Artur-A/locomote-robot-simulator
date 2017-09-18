# Size of the Tabletop
class TabletopSize
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def range_x
    (0..@width -1)
  end

  def range_y
    (0..@height -1)
  end

  def include?(x, y)
    range_x.include?(x) && range_y.include?(y)
  end
end