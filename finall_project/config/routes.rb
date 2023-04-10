Rails.application.routes.draw do
  root 'my_page#home'
  get 'session/new'
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  get "/signup", to: "user#new"
  delete "/logout", to: "session#destroy"
  get "send", to: "my_page#send_thanks_card"
  get "sendnew", to: "my_page#send_new_thanks_card"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :user
  resources :thanks_card
  resources :account_activations, only: [:edit]
end
