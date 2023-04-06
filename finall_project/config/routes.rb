Rails.application.routes.draw do
  get "/login", to: "session#new"
  post "/login", to: ""
  get "/signup", to: "user#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :user
  resources :thanks_card
  root 'my_page#home'
end
