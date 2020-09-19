Rails.application.routes.draw do
  root to: 'gatyas#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  post 'gatyas/position', to: 'gatyas#position'
  get 'gatyas/result', to: 'gatyas#result'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :interests
    end
   end
    
  
  get 'posts/:id/new', to: 'posts#new'
  
  resources :posts, only: [:create, :destroy, :index]
  resources :interests, only: [:create, :destroy]
    
 
end
