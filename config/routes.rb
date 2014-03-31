Temp::Application.routes.draw do

  get "/about_us" => "home#about"
  get "/help" => "help#index"

  # get "/questions" => "questions#index"
  # post "/questions" => "questions#create"
  # get "/questions/:id" => "questions#show" 
  # get "/questions/:id/edit" => "questions#edit"
  # get "/questions/new" => "questions#new" 
  # patch "/questions/:id" => "questions#update"
  # match "/questions/:id" => "questions#update", via: [:put, :patch]
  # delete "/questions/:id" => "questions#destroy"
  # all of the above can be done like the following line
  resources :questions do  
    member do
      post :vote_down
      post :vote_up
    end

    post :search, on: :collection
  end

  root "questions#index" #this means the index of questions will be my homepage

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
