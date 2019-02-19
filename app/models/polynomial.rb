class Polynomial
  # @param coefficients [Array[FixedNum]]
  def initialize(coefficients)
    @coefficients = coefficients
  end

  attr_reader :coefficients

  # @param coefficients_string [String] coefficients in the format '3/2/1'
  # @return [Polynomial] a new object with the given coefficients
  def self.parse_string(coefficients_string)
    new(coefficients_string.split('/').map &:to_i)
  end
end