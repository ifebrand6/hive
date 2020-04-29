# == Route Map
#
#                          Prefix Verb   URI Pattern                                                                              Controller#Action
#                            blog GET    /blog(.:format)                                                                          blog#index
#                     single_post GET    /blog/single_post/:id(.:format)                                                          blog#single_post
#                blog_add_comment POST   /blog/add_comment(.:format)                                                              blog#add_comment
#                           posts GET    /posts(.:format)                                                                         posts#index
#                                 POST   /posts(.:format)                                                                         posts#create
#                        new_post GET    /posts/new(.:format)                                                                     posts#new
#                       edit_post GET    /posts/:id/edit(.:format)                                                                posts#edit
#                            post GET    /posts/:id(.:format)                                                                     posts#show
#                                 PATCH  /posts/:id(.:format)                                                                     posts#update
#                                 PUT    /posts/:id(.:format)                                                                     posts#update
#                                 DELETE /posts/:id(.:format)                                                                     posts#destroy
#                        comments POST   /comments(.:format)                                                                      comments#create
#                         comment GET    /comments/:id(.:format)                                                                  comments#show
#                        requests GET    /requests(.:format)                                                                      requests#index
#                                 POST   /requests(.:format)                                                                      requests#create
#                     new_request GET    /requests/new(.:format)                                                                  requests#new
#                    edit_request GET    /requests/:id/edit(.:format)                                                             requests#edit
#                         request GET    /requests/:id(.:format)                                                                  requests#show
#                                 PATCH  /requests/:id(.:format)                                                                  requests#update
#                                 PUT    /requests/:id(.:format)                                                                  requests#update
#                                 DELETE /requests/:id(.:format)                                                                  requests#destroy
#                 dashboard_index GET    /dashboard/index(.:format)                                                               dashboard#index
#           dashboard_application GET    /dashboard/application(.:format)                                                         dashboard#application
#               dashboard_talents GET    /dashboard/talents(.:format)                                                             dashboard#talents
#    dashboard_customers_requests GET    /dashboard/customers_requests(.:format)                                                  dashboard#customers_requests
#                 talent_requests GET    /dashboard/customer_talent_requests/:id(.:format)                                        dashboard#customer_talent_requests
#               customer_requests GET    /dashboard/customer_requests/:id(.:format)                                               dashboard#customer_requests
#               talent_assignment GET    /dashboard/talent_assignment/:id(.:format)                                               dashboard#talent_assignment
# dashboard_finalize_user_request POST   /dashboard/finalize_user_request(.:format)                                               dashboard#finalize_user_request
#                         onboard GET    /onboard/:id(.:format)                                                                   expert_applications#accept_application
#             expert_applications GET    /application(.:format)                                                                   expert_applications#index
#                                 POST   /application(.:format)                                                                   expert_applications#create
#          new_expert_application GET    /application/new(.:format)                                                               expert_applications#new
#         edit_expert_application GET    /application/:id/edit(.:format)                                                          expert_applications#edit
#              expert_application GET    /application/:id(.:format)                                                               expert_applications#show
#                                 PATCH  /application/:id(.:format)                                                               expert_applications#update
#                                 PUT    /application/:id(.:format)                                                               expert_applications#update
#                                 DELETE /application/:id(.:format)                                                               expert_applications#destroy
#                     rails_admin        /admin                                                                                   RailsAdmin::Engine
#                            root GET    /                                                                                        home#index
#                  userrole_index GET    /userrole/index(.:format)                                                                userrole#index
#                   userrole_test GET    /userrole/test(.:format)                                                                 userrole#test
#                new_user_session GET    /user/sign_in(.:format)                                                                  devise/sessions#new
#                    user_session POST   /user/sign_in(.:format)                                                                  devise/sessions#create
#            destroy_user_session DELETE /user/sign_out(.:format)                                                                 devise/sessions#destroy
#               new_user_password GET    /user/password/new(.:format)                                                             devise/passwords#new
#              edit_user_password GET    /user/password/edit(.:format)                                                            devise/passwords#edit
#                   user_password PATCH  /user/password(.:format)                                                                 devise/passwords#update
#                                 PUT    /user/password(.:format)                                                                 devise/passwords#update
#                                 POST   /user/password(.:format)                                                                 devise/passwords#create
#        cancel_user_registration GET    /user/cancel(.:format)                                                                   devise/registrations#cancel
#           new_user_registration GET    /user/sign_up(.:format)                                                                  devise/registrations#new
#          edit_user_registration GET    /user/edit(.:format)                                                                     devise/registrations#edit
#               user_registration PATCH  /user(.:format)                                                                          devise/registrations#update
#                                 PUT    /user(.:format)                                                                          devise/registrations#update
#                                 DELETE /user(.:format)                                                                          devise/registrations#destroy
#                                 POST   /user(.:format)                                                                          devise/registrations#create
#                            test GET    /test(.:format)                                                                          home#test
#                  become_partner GET    /become-partner(.:format)                                                                home#become_a_partner
#                         contact GET    /contact(.:format)                                                                       home#contact
#                     home_create POST   /home/create(.:format)                                                                   home#create
#              rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#       rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#              rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#       update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#            rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :experts, path: 'application'
  # CUSTOMER DASHBO
  get 'verify/:id', to: 'transactions#verify_transaction', as: 'verify'
  resources :transactions
  get 'thank-you', to: 'customer_dashboard#thank_you', as: 'thank_you'
  get '/dashboard', to: 'customer_dashboard#index',as: 'dashboard'
  get 'my-finalized-requests', to: 'customer_dashboard#finalized_requests', as: 'customer_finalized_requests'
  get 'my-finalized-request/:id', to: 'customer_dashboard#show_finalized_request', as: 'show_customer_finalized_request'
  get 'make-payment', to: 'customer_dashboard#make_payment_for_finalized_request', as: 'make_payment_for_finalized_request'
  get 'my-transcations',to: 'customer_dashboard#transactions', as: 'customer_transcations'
  get 'my-transcation/:id', to: 'customer_dashboard#show_transcation', as: 'customer_transcation'
  get 'my-requests', to: 'customer_dashboard#my_request', as: 'my_customer_requests'
  get 'my-request/:id',to: 'customer_dashboard#show_request', as: 'my_customer_request'
  get 'delete-my-request/:id', to: 'customer_dashboard#delete_request',as: 'delete_customer_request'
  get 'blog'  => 'blog#index'
  get 'blog/single_post/:id' => 'blog#single_post', :as => 'single_post'
  post 'blog/add_comment' => 'blog#add_comment'
  resources :posts
  resources :comments, only: [:create,:show]
  resources :requests
  get 'dashboard/index'
  get 'dashboard/application'
  get 'dashboard/talents'
  get 'dashboard/customers_requests'
  get 'dashboard/customer_talent_requests/:id' => 'dashboard#customer_talent_requests', :as => 'talent_requests'
  get 'dashboard/customer_requests/:id' => 'dashboard#customer_requests', :as => 'customer_requests'
  get 'dashboard/talent_assignment/:id' => 'dashboard#talent_assignment', :as => 'talent_assignment'
  post "dashboard/finalize_user_request", to: "dashboard#finalize_user_request"
  get 'onboard/:id' => 'expert_applications#accept_application', :as => 'onboard'
  #get '/apply', to: " expert_application#apply" #rename route so site/career/appy
  # resources :expert_applications, path: 'application'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'userrole/index'
  get 'userrole/test'
  devise_for :user
  get "/test", to: "home#test"
  get '/become-partner', to: "home#become_a_partner"
  get '/contact', to: "home#contact"
  post "home/create", to: "home#create"
end
