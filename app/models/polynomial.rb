class Polynomial
  # @param coefficients [Array[FixedNum]]
  def initialize(coefficients)
    @coefficients = coefficients
  end

  # @param coefficients_string [String] coefficients in the format '3/2/1'
  # @return [String] the differentiated polynomial in the form 2x^2+x+1
  def self.string_to_differentiated_polynomial(coefficients_string)
    parse_string(coefficients_string).differentiate().to_s
  end

  attr_reader :coefficients

  # @param coefficients_string [String] coefficients in the format '3/2/1'
  # @return [Polynomial] a new object with the given coefficients
  def self.parse_string(coefficients_string)
    new(coefficients_string.split('/').map &:to_i)
  end

  # @return [Polynomial] a new object with the differentiated coefficients
  def differentiate
    # TODO FAKE
    return self
  end

  # creates a string representation in the form 2x^2+x+1
  def to_s
    # TODO FAKE
    @coefficients.join('+')
  end
end