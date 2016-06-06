Rails.application.routes.draw do
  get 'products/home'
 
  get 'products/login'

  get 'products/homexls'

  get 'products/hxls'

  get 'products/dd'

  get 'products/result1'
  
  post 'products/result1'

  get 'products/login_process'

  get 'products/new_account'

  get 'products/new_account_process'

  get 'products/browser'

  get 'products/help_browser'

  get 'products/browser_process'

  get 'products/result'

  get 'products/result_process'

  get 'products/aboutus'

  get 'products/description'

  get 'products/details'

  get 'products/logout'
  get 'products/search_edit'

  post 'products/result'

  put 'products/result_process'

  patch 'products/result_process'

  post  'products/result_process'

  get 'products/manu_edit2'

  post 'products/login'

  post 'products/login_process'
 
  post 'products/browser'

  post 'products/browser_process'

  post 'products/new_account_process'

  post 'products/description'

  post 'products/details'

  post 'products/aboutus'

  post 'products/logout'
  
  post 'products/home'

  post 'products/homexls'
 
  post 'products/hxls'

  post 'products/dd'

  get 'products/show'
  get 'products/manu_cate'
  get 'products/manu1'
  get 'products/manu1_edit'
  get 'products/manu_desc'
  get 'products/compare'
  get 'products/manu_index_compare'
  get 'products/manu_compare'
post 'products/manu_index_compare'
  post 'products/manu_compare'
  get 'products/compare_process'

  post 'products/compare'

  post 'products/compare_process'
   get 'products/manu'
resources :products do
get 'dest2'

  
  get 'manu_index'
  

 end


  

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'products#home'

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
