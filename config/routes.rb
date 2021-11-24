Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    resources :bookings
  end

  get '/dashboard', to: 'pages#dashboard', as: :dashboard
end
