HealthpostFacebook::Application.routes.draw do
  devise_for :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'providers#show'

  get 'admin' => 'admin/main#show'

  resources :providers

  namespace 'admin' do
    resources :providers
    resources :provider_facebook_pages
    resources :provider_displays
  end

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
# Generated on 08 Aug 2013 00:15
#
#                  new_user_session GET    /users/sign_in(.:format)                          devise/sessions#new
#                      user_session POST   /users/sign_in(.:format)                          devise/sessions#create
#              destroy_user_session DELETE /users/sign_out(.:format)                         devise/sessions#destroy
#                     user_password POST   /users/password(.:format)                         devise/passwords#create
#                 new_user_password GET    /users/password/new(.:format)                     devise/passwords#new
#                edit_user_password GET    /users/password/edit(.:format)                    devise/passwords#edit
#                                   PATCH  /users/password(.:format)                         devise/passwords#update
#                                   PUT    /users/password(.:format)                         devise/passwords#update
#          cancel_user_registration GET    /users/cancel(.:format)                           devise/registrations#cancel
#                 user_registration POST   /users(.:format)                                  devise/registrations#create
#             new_user_registration GET    /users/sign_up(.:format)                          devise/registrations#new
#            edit_user_registration GET    /users/edit(.:format)                             devise/registrations#edit
#                                   PATCH  /users(.:format)                                  devise/registrations#update
#                                   PUT    /users(.:format)                                  devise/registrations#update
#                                   DELETE /users(.:format)                                  devise/registrations#destroy
#                              root GET    /                                                 providers#show
#                             admin GET    /admin(.:format)                                  admin/main#show
#                         providers GET    /providers(.:format)                              providers#index
#                                   POST   /providers(.:format)                              providers#create
#                      new_provider GET    /providers/new(.:format)                          providers#new
#                     edit_provider GET    /providers/:id/edit(.:format)                     providers#edit
#                          provider GET    /providers/:id(.:format)                          providers#show
#                                   PATCH  /providers/:id(.:format)                          providers#update
#                                   PUT    /providers/:id(.:format)                          providers#update
#                                   DELETE /providers/:id(.:format)                          providers#destroy
#                   admin_providers GET    /admin/providers(.:format)                        admin/providers#index
#                                   POST   /admin/providers(.:format)                        admin/providers#create
#                new_admin_provider GET    /admin/providers/new(.:format)                    admin/providers#new
#               edit_admin_provider GET    /admin/providers/:id/edit(.:format)               admin/providers#edit
#                    admin_provider GET    /admin/providers/:id(.:format)                    admin/providers#show
#                                   PATCH  /admin/providers/:id(.:format)                    admin/providers#update
#                                   PUT    /admin/providers/:id(.:format)                    admin/providers#update
#                                   DELETE /admin/providers/:id(.:format)                    admin/providers#destroy
#     admin_provider_facebook_pages GET    /admin/provider_facebook_pages(.:format)          admin/provider_facebook_pages#index
#                                   POST   /admin/provider_facebook_pages(.:format)          admin/provider_facebook_pages#create
#  new_admin_provider_facebook_page GET    /admin/provider_facebook_pages/new(.:format)      admin/provider_facebook_pages#new
# edit_admin_provider_facebook_page GET    /admin/provider_facebook_pages/:id/edit(.:format) admin/provider_facebook_pages#edit
#      admin_provider_facebook_page GET    /admin/provider_facebook_pages/:id(.:format)      admin/provider_facebook_pages#show
#                                   PATCH  /admin/provider_facebook_pages/:id(.:format)      admin/provider_facebook_pages#update
#                                   PUT    /admin/provider_facebook_pages/:id(.:format)      admin/provider_facebook_pages#update
#                                   DELETE /admin/provider_facebook_pages/:id(.:format)      admin/provider_facebook_pages#destroy
#           admin_provider_displays GET    /admin/provider_displays(.:format)                admin/provider_displays#index
#                                   POST   /admin/provider_displays(.:format)                admin/provider_displays#create
#        new_admin_provider_display GET    /admin/provider_displays/new(.:format)            admin/provider_displays#new
#       edit_admin_provider_display GET    /admin/provider_displays/:id/edit(.:format)       admin/provider_displays#edit
#            admin_provider_display GET    /admin/provider_displays/:id(.:format)            admin/provider_displays#show
#                                   PATCH  /admin/provider_displays/:id(.:format)            admin/provider_displays#update
#                                   PUT    /admin/provider_displays/:id(.:format)            admin/provider_displays#update
#                                   DELETE /admin/provider_displays/:id(.:format)            admin/provider_displays#destroy
