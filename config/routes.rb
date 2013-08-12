HealthpostFacebook::Application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/healthpost/:id' => 'healthpost#show', as: 'healthpost'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'providers#show'

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
#== Route Map
# Generated on 12 Aug 2013 15:58
#
#       new_user_session GET        /users/login(.:format)            active_admin/devise/sessions#new
#           user_session POST       /users/login(.:format)            active_admin/devise/sessions#create
#   destroy_user_session DELETE|GET /users/logout(.:format)           active_admin/devise/sessions#destroy
#          user_password POST       /users/password(.:format)         active_admin/devise/passwords#create
#      new_user_password GET        /users/password/new(.:format)     active_admin/devise/passwords#new
#     edit_user_password GET        /users/password/edit(.:format)    active_admin/devise/passwords#edit
#                        PATCH      /users/password(.:format)         active_admin/devise/passwords#update
#                        PUT        /users/password(.:format)         active_admin/devise/passwords#update
#                   root GET        /                                 application#redirect
#              dashboard GET        /dashboard(.:format)              dashboard#index
# batch_action_providers POST       /providers/batch_action(.:format) providers#batch_action
#              providers GET        /providers(.:format)              providers#index
#                        POST       /providers(.:format)              providers#create
#           new_provider GET        /providers/new(.:format)          providers#new
#          edit_provider GET        /providers/:id/edit(.:format)     providers#edit
#               provider GET        /providers/:id(.:format)          providers#show
#                        PATCH      /providers/:id(.:format)          providers#update
#                        PUT        /providers/:id(.:format)          providers#update
#                        DELETE     /providers/:id(.:format)          providers#destroy
#     batch_action_users POST       /users/batch_action(.:format)     users#batch_action
#                  users GET        /users(.:format)                  users#index
#                        POST       /users(.:format)                  users#create
#               new_user GET        /users/new(.:format)              users#new
#              edit_user GET        /users/:id/edit(.:format)         users#edit
#                   user GET        /users/:id(.:format)              users#show
#                        PATCH      /users/:id(.:format)              users#update
#                        PUT        /users/:id(.:format)              users#update
#                        DELETE     /users/:id(.:format)              users#destroy
#             healthpost GET        /healthpost/:id(.:format)         healthpost#show
