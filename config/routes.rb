Rails.application.routes.draw do
  
  resources :users
  root  'users_videos#index'
  resources :users_videos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
