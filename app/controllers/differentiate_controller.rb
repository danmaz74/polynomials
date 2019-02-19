class DifferentiateController < ApplicationController
  def index
    render plain: params[:coefficients]
  end
end
