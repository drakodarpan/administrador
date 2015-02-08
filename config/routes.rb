Rails.application.routes.draw do
  devise_for :usuarios
  resource :usuarios
  
  root :to => 'home#index'
end
