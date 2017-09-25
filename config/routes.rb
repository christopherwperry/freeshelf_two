Rails.application.routes.draw do

  get 'sessions/new'

  resources :users
  resources :books
  resources :sessions

  root to: 'books#index'

  get 'books/index'

  get 'books/show'

  get 'books/edit'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
