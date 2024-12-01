Rails.application.routes.draw do
    root 'products#index'
    post '/products/add_product', to: 'products#add_product', as: 'add_product'

    resources :products do
        collection do
          post 'add_product'
        end
      end
    
end
