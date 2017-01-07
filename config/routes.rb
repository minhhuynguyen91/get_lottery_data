Rails.application.routes.draw do
  get '/home' => 'static_pages#home'

  get '/help' => 'static_pages#help'

  get '/contact' => 'static_pages#contact'

  get 'fetch_task' => 'static_pages#new'
  
  post 'fetch_task' => 'static_pages#create' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
