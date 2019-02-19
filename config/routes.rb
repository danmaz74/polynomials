Rails.application.routes.draw do
  get 'differentiate/*coefficients', to: 'differentiate#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
