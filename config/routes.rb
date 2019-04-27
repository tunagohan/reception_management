Rails.application.routes.draw do
  get '/reception', to: 'receptions#index'
end
