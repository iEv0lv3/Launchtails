Rails.application.routes.draw do
  root 'drinks#index'
  devise_for :users

  resources :drinks, only: [:index, :new, :create, :destroy]
  get '/featured-drinks', to: 'featured_drinks#index'

  resources :categories, only: [:index, :show] do
    get 'drinks', to: 'categories#show'
  end

end
