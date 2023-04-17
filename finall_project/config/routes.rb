Rails.application.routes.draw do
  root "my_page#home"
  get "session/new"
  get "/login", to: "session#new"
  post "/login", to: "session#create"
  get "/signup", to: "user#new"
  delete "/logout", to: "session#destroy"
  get "send", to: "my_page#send_thanks_card"
  get "sendnew", to: "my_page#send_new_thanks_card"
  get "thankscardelete", to: "my_page#getall_tkcard_delete"
  get "receiver", to: "my_page#receiver"
  get "receiverdelete", to: "my_page#getall_tkcardreceiver_delete"


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :user
  resources :thanks_card
  resources :users_receiver, only: [:show, :destroy]
  resources :account_activations, only: [:edit]
end
