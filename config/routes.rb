Stockslist2::Application.routes.draw do
  
  get "users/index"
  get "users/show"

  devise_for :users, controllers: { registrations: "registrations"}

  devise_scope :user do
    resources :users
  end  

  get "stock_fetch/yahoo_data"
  get "stock_fetch/yahoo_short_info"
  get "stock_fetch/yahoo_info"
  
  get "home/index"
  root :to => 'home#index'
  resources :stocklists
  #resources :stock_fetch
  
  scope :api do
    get "/users(.:format)" => "users#index"
    get "/users/:id(.:format)" => "users#show"
    get "/stocklists(.:format)" => "stocklists#index"
    get "/stocklists/:id(.:format)" => "stocklists#show"
    post "/stocklists(.:format)" => "stocklists#create"
    put "/stocklists/:id(.:format)" => "stocklists#update"
    delete "/stocklists/:id(.:format)" => "stocklists#destroy"
  end
end
