Rails.application.routes.draw do
  
  devise_for :users
  # /reviews/.....

  resources :reviews
  # /books/:id/reviews

  post "/busqueda" => ""

  resources :books do

    member do
      post 'publish'  #  /books/:id/publish   publish_book  
    end
  
    collection do
      post 'search' #  /books/search   search_books  path: "buscar"   #
      post 'publish' #     publish_books   "/books/publish?ids=1,2,3,4,5"
    end

    # /books/:id/reviews/.....
    resources :reviews do
      # /books/:book_id/reviews/:review_id/comments
      resources :comments
    end

  end

  #get "/buscar" => "books#search"

  root 'books#index'

  get "/login" => "sessions#new"
  get "/nologin" => "sessions#error"


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
