Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/liliopsidas", controller: "products", action: "orchid_lovers"

  #shorter way
  get "/products/:id" => "products#show"

  get "/products" => "products#index"

  post "/products" => "products#create"

  put "/products/:id" => "products#update"

  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"

  get "suppliers/:id" => "suppliers#show"

 #long way:  get "/others", controller: "products", action: "dahlia_lovers"

 #USERS
  post "/users" => "users#create" #creates user
  post "/sessions" => "sessions#create" #logs user in

#Orders

  post "/orders" => "orders#create"

  get "/orders/:id" => "orders#show" 
  
  get "/orders" => "orders#index"

  #Cart

  post "/carted_products" => "carted_products#create" 
  get "/carted_products" => "carted_products#index"


end


