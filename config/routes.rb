Rails.application.routes.draw do
  resources :categories
  resources :subcategories
  resources :prices

  root 'pages#home'
end
