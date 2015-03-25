Rails.application.routes.draw do
  resources :categories
  resources :subcategories
  resources :prices

  root 'pages#home'

  match '/price/create_row', to: 'prices#create_row', via: 'post', as: :create_price_row
end
