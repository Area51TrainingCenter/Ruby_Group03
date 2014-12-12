Rails.application.routes.draw do
  resources :book_categories

  resources :categories

  resources :contacts

  resources :authors
  
  #get "books/:year" => "books#index", constraints: {year: /\d{4}/ }
  #get "books/:year(/:month)" => "books#index", constraints: {year: /\d{4}/, month: /\d{1,2}/ }
  get "/books" => "books#index"
  get "books/:year(/:month(/:day))" => "books#index", constraints: {year: /\d{4}/, month: /\d{1,2}/ }


  # DSL  = Domain Specific Language
  resources :books do
    member do
      post 'publish'
    end

    collection do
      get 'search'
      post 'search'
      #delete "armageddon"
    end
  end

  get "amazon" => "books#amazon", as: :bookstore


  get "libros" => "books#index"
  get "info.:format" => "books#info"
  get "maslibros", to: redirect("http://amazon.com")

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
