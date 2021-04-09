Rails.application.routes.draw do
  root 'welcome#index'
  resources :surveys
  resources :smoothiechoices
  resources :welcome  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
