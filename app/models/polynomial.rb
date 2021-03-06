class Polynomial
  # @param coefficients [Array[FixedNum]]
  def initialize(coefficients)
    @coefficients = coefficients
  end

  # executes the whole process from input string to output differentiated string
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
    exponent = @coefficients.size

    new_coefficients = @coefficients[0..-2].map do |coefficient|
      exponent -= 1

      coefficient * exponent
    end

    return Polynomial.new(new_coefficients)
  end

  # creates a string representation in the form 2x^2+x+1
  def to_s
    output =''

    exponent = @coefficients.size-1

    @coefficients.each do |coefficient|
      new_term = Polynomial.render_term(coefficient, exponent)

      if !new_term.blank? # skip empty terms
        if new_term[0] == '-'
          output += new_term
        else
          if output.size > 0
            output += '+'
          end

          output += new_term
        end
      end

      exponent -= 1
    end

    return output
  end

  # @param coefficient [FixedNum]
  # @param exponent [FixedNum]
  # @return [String] a string representation of one term of the polynomial
  def self.render_term(coefficient, exponent)
    return '' if coefficient == 0

    coefficient_string = case coefficient
                           when 1 then ''
                           when -1 then '-'
                           else coefficient.to_s
                         end

    return case exponent
             when 0 then coefficient.to_s
             when 1 then "#{coefficient_string}x"
             else "#{coefficient_string}x^#{exponent}"
    end
  end
end