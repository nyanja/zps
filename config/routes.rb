Rails.application.routes.draw do
  resources :meows
  resources :tags,        path: "admin/tags"
  resources :categories,  path: "admin/categories"
  resources :articles,    path: "admin/articles"
  resources :comments,    path: "admin/comments"
  root to: "pages#catalog"
  get "/admin", to: "pages#admin"
  get "/catalog", to: "pages#catalog"
  get "/c/:slug", to: "pages#category", as: :category_page
  get "/:slug", to: "pages#article"
end
