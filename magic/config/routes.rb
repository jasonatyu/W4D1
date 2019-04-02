Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:update, :show, :index, :create, :destroy] do 
    resources :artworks, only: [:index, :show] 
  end 
  resources :artworks, only: [:update, :show, :destroy, :create]
  resources :artwork_shares, only: [:create, :destroy]
  
end
