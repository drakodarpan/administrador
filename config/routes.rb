Rails.application.routes.draw do
  devise_for :usuarios
  resources :usuarios 
  resources :comentarios

  root :to => 'home#index'
end
