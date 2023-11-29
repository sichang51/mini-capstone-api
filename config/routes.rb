Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # get "/all_products", controller: "products", action: "all_products"

  # get "/first_product", controller: "products", action: "first_product"

  # get "/second_product", controller: "products", action: "second_product"

  # get "/one_product/:id" => "products#one_product"

  # for Products table
  get "/products" => "products#index"
  post "/products.json" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  # suppliers
  get "/suppliers" => "suppliers#index"
  post "/suppliers.json" => "suppliers#create"
  get "/suppliers/:id" => "suppliers#show"
  patch "/suppliers/:id" => "suppliers#update"
  delete "/suppliers/:id" => "suppliers#destroy"

  # orders
  get "/orders" => "orders#index"
  post "/orders" => "orders#create"
  get "/orders/:id" => "orders#show"

  # users table
  post "/users" => "users#create"           #signup
  post "/sessions" => "sessions#create"     #login

  # carts table
  post "/cart" => "carted_products#create"
end
