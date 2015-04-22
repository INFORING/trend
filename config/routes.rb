Rails.application.routes.draw do
  root 'pages#home'

  resources :subcategories

  resources :sections	do
  	resources :categories
	end
  
	resources :prices do 
	  get '/rows/new', to: 'prices#new_row', as: :new_row
  	post '/rows', to: 'prices#create_row', as: :rows
  	delete '/rows/:count', to: 'prices#destroy_row', as: :row
  	get '/columns/new', to: 'prices#new_column', as: :new_column
  	get '/column/:id/edit', to: 'prices#edit_column', as: :edit_column
  	post '/columns/', to: 'prices#create_column', as: :columns
  	put '/column/:id', to: 'prices#update_column', as: :column
  	delete '/column/:id', to: 'prices#destroy_column'
  end

  scope :admin do 
    get '/signin', to: "pages#admin_signin", as: :admin_signin
    post '/create_session', to: "pages#admin_session_create", as: :admin_session_create
    put '/change_password', to: "pages#admin_change_password", as: :admin_change_password
    delete '/signout', to: "pages#admin_session_destroy", as: :admin_signout
  end


  get '/contact', to: 'pages#contact'
  post '/feedback', to: 'pages#feedback'
  get '/order', to: 'pages#order', as: :order_path
  post '/order/send', to: 'pages#send_order', as: :send_order
end
