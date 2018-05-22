Rails.application.routes.draw do
  root to: 'pages#home'
  resources :articles
  get '/:slug', to: 'pages#article'
end
