class String
  def to_i_or_nil
    Integer(self || '')
  rescue ArgumentError
    nil
  end
end