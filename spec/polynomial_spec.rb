require 'rails_helper'

describe Polynomial do
  describe '.parse_string' do
    let(:coefficients_string) { '1/-2/0/1' }

    it 'parses the coefficients correctly' do
      polynomial = Polynomial.parse_string(coefficients_string)

      expect(polynomial.coefficients).to eq([1,-2,0,1])
    end
  end
end