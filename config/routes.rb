Rails.application.routes.draw do
  root to: 'companies#index'

  resources :companies do
    resources :tags, only: [:create]
  end

  resources :founders, only: [:create]
end
