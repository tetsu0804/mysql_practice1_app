Rails.application.routes.draw do
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    post '/book', controller: :books, action: :create
    get '/books', controller: :books,  action: :index
  end
end
