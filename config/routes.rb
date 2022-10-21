Rails.application.routes.draw do
  get "/", to: 'api/v1/guest/content_videos#index'

  namespace :admin, format: 'json' do
    resources :tags
  end

  namespace :api, format: 'json' do
    namespace :v1 do
      namespace :guest do
        resources :content_videos
      end
      namespace :user do
        resources :user, only: [:create]
        resources :content_videos

        resources :content_video_likes, only: [:create, :destroy]
        resources :content_video_loves, only: [:create, :destroy]
        resources :content_video_comments, only: [:create, :edit, :update, :destroy]

        resources :user_videos, only: [:new, :show, :create, :destroy]
        resources :completed_video_likes, only: [:create, :destroy]
        resources :completed_video_loves, only: [:create, :destroy]
        resources :completed_video_comments, only: [:create, :edit, :update, :destroy]

      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
