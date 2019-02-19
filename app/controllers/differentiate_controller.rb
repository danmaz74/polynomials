class DifferentiateController < ApplicationController
  def index
    render plain: Polynomial.string_to_differentiated_polynomial(params[:coefficients])
  end
end
