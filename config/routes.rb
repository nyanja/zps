Rails.application.routes.draw do
  resources :categories
  resources :tags
  root to: 'pages#home'
  resources :articles
  get '/:slug', to: 'pages#article'
end
