require 'rails_helper'

describe Polynomial do
  xdescribe '.string_to_differentiated_polynomial'

  describe '.parse_string' do
    let(:coefficients_string) { '1/-2/0/1' }

    it 'parses the coefficients correctly' do
      polynomial = Polynomial.parse_string(coefficients_string)

      expect(polynomial.coefficients).to eq([1,-2,0,1])
    end
  end

  describe '#differentiate' do
    context 'simple case' do
      let(:polynomial) { Polynomial.new([2,3,4]) }

      it 'differentiates correctly' do
        expect(polynomial.differentiate().coefficients).to eq([4, 3])
      end
    end

    context 'complex case' do
      let(:polynomial) { Polynomial.new([-12,7,0,-4]) }

      it 'differentiates correctly' do
        expect(polynomial.differentiate().coefficients).to eq([-36, 14, 0])
      end
    end
  end

  describe '#to_s' do
    context 'simple case' do
      let(:polynomial) { Polynomial.new([2,3,4]) }

      it 'prints correctly' do
        expect(polynomial.to_s).to eq('2x^2+3x+4')
      end
    end

    context 'with coefficients 0' do
      let(:polynomial) { Polynomial.new([2,0,0]) }

      it 'does not print the terms with coefficient 0' do
        expect(polynomial.to_s).to eq('2x^2')
      end
    end

    context 'with coefficient 1' do
      let(:polynomial) { Polynomial.new([2,1,1]) }

      it 'does not print the coefficient 1' do
        expect(polynomial.to_s).to eq('2x^2+x+1')
      end
    end

    context 'with negative coefficient' do
      let(:polynomial) { Polynomial.new([2,-1,-1]) }

      it 'does not print the coefficient 1' do
        expect(polynomial.to_s).to eq('2x^2-x-1')
      end
    end
  end

  describe '.render_term' do
    it 'renders correctly coefficient 1' do
      expect(Polynomial.render_term(1, 1)).to eq('x')
    end

    it 'renders correctly exponent 0' do
      expect(Polynomial.render_term(1, 0)).to eq('1')
    end

    it 'renders correctly a negative coefficient' do
      expect(Polynomial.render_term(-5, 2)).to eq('-5x^2')
    end
  end
end