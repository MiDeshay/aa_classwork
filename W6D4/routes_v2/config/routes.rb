# Prefix Verb   URI Pattern                             Controller#Action
# user_artworks GET    /users/:user_id/artworks(.:format)                                                       artworks#index
# users GET    /users(.:format)                        users#index
# POST   /users(.:format)                        users#create
# user GET    /users/:id(.:format)                    users#show
# PATCH  /users/:id(.:format)                    users#update
# PUT    /users/:id(.:format)                    users#update
# DELETE /users/:id(.:format)                    users#destroy


# artwork_shares POST   /artwork_shares(.:format)                                              artwork_shares#create
# artwork_share DELETE /artwork_shares/:id(.:format)                                           artwork_shares#destroy


# artworks GET    /artworks(.:format)                   artworks#index
# POST   /artworks(.:format)                   artworks#create
# artwork GET    /artworks/:id(.:format)               artworks#show
# PATCH  /artworks/:id(.:format)               artworks#update
# PUT    /artworks/:id(.:format)               artworks#update
# DELETE /artworks/:id(.:format)               artworks#destroy

# comments GET    /comments(.:format)              comments#index
# comments POST   /comments(.:format)               comments#create
# comment DELETE /comments/:id(.:format)          comments#destroy

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:create, :destroy, :index, :show, :update ] do
    resources :artworks, only: [:index]
  end
  
  resources :artwork_shares, only: [:create, :destroy]

  resources :artworks, only: [:create, :destroy, :index, :show, :update ]

  resources :comments, only: [:create, :destroy, :index]

end
