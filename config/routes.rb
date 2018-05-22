Rails.application.routes.draw do
  resources :tags
  root to: 'pages#home'
  resources :articles
  get '/:slug', to: 'pages#article'
end
