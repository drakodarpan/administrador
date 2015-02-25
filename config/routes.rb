Rails.application.routes.draw do
  devise_for :usuarios
  resource :usuarios
  resources :comentario

  root :to => 'home#index'
end
