Rails.application.routes.draw do
  resources :tags,        path: 'admin/tags'
  resources :categories,  path: 'admin/categories'
  resources :articles,    path: 'admin/articles'
  root to: 'pages#home'
  get '/:slug', to: 'pages#article'
end
