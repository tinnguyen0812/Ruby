Rails.application.routes.draw do
  resources :sp_carts
  resources :carts

    root "products#index"
    

  
end
