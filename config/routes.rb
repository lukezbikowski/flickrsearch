Rails.application.routes.draw do
  resources :photos, only: [:index]

  root 'photos#index'
end
