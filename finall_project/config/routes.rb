Rails.application.routes.draw do
  get 'session/new'
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  get "/signup", to: "user#new"
  delete "/logout", to: "session#destroy"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :user
  resources :thanks_card
  root 'my_page#home'
end
