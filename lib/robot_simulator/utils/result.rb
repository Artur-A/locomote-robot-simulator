require_relative('./object')

# A result of an operation
class Result
  attr_reader :error, :value

  def initialize(value, error = nil)
    @value = value
    @error = error
  end

  def success?
    @error.blank?
  end
end