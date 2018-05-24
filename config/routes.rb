Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'products/:id' => 'products#show', as: :show_product
  resources :products
end
