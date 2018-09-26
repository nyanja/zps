Rails.application.routes.draw do
  resources :meows,       path: "admin/meows"
  resources :tags,        path: "admin/tags"
  resources :categories,  path: "admin/categories"
  resources :articles,    path: "admin/articles"
  resources :comments,    path: "admin/comments"
  root to: "pages#home"
  get "/admin", to: "pages#admin"
  get "/catalog", to: "pages#catalog"
  get "/:category_slug/:slug", to: "pages#article", as: :article_page
  get "/:slug", to: "pages#category", as: :category_page
end
