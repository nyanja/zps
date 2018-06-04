Rails.application.routes.draw do
  resources :tags,        path: 'admin/tags'
  resources :categories,  path: 'admin/categories'
  resources :articles,    path: 'admin/articles'
  resources :comments,    path: 'admin/comments'
  root to: 'pages#home'
  get '/c/:slug', to: 'pages#category'
  get '/:slug', to: 'pages#article'
end
