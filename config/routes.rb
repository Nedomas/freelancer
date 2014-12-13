Rails.application.routes.draw do
  root 'posts#index'

  resources :buckets
  resources :posts
  get 'update/index', as: :update
  resources :related_posts
  get 'related_posts/reject/:id' => 'related_posts#reject', as: :reject_related_post
end
