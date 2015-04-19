Rails.application.routes.draw do
  root 'pages#home'

  resources :subcategories

  resources :sections	do
  	resources :categories
	end
  
	resources :prices do 
	  get '/rows/new', to: 'prices#new_row', as: :new_row
  	post '/rows', to: 'prices#create_row', as: :rows
  	delete 'rows/:count', to: 'prices#destroy_row', as: :row
  	get '/columns/new', to: 'prices#new_column', as: :new_column
  	get '/column/:id/edit', to: 'prices#edit_column', as: :edit_column
  	post '/columns/', to: 'prices#create_column', as: :columns
  	put '/column/:id', to: 'prices#update_column', as: :column
  	delete '/column/:id', to: 'prices#destroy_column'
  end

  match '/contact', to: 'pages#contact', via: 'get'
end
