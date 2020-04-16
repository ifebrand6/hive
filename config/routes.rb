Rails.application.routes.draw do

  # CUSTOMER DASHBO
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

  scope 'admin'  do 
    resources :posts
  end
  resources :comments, only: [:create,:show]
  resources :get_experts, only: [:new,:create], path: 'book-an-agriculture-expert_service'
  get "/admin", to: "admin#index"
  get 'admin/application'
  get 'admin/talents'
  get 'admin/customers_requests'
  get 'admin/customer_talent_requests/:id' => 'admin#customer_talent_requests', :as => 'talent_requests'
  get 'admin/customer_requests/:id' => 'admin#customer_requests', :as => 'customer_requests'
  get 'admin/talent_assignment/:id' => 'admin#talent_assignment', :as => 'talent_assignment'
  post "admin/finalize_user_request(/:id)", to: "admin#finalize_user_request"
  get 'accept/:id' => 'expert_applications#accept_application', :as => 'onboard'
  resources :expert_applications, path: 'application'
  mount RailsAdmin::Engine => '/super-admin', as: 'rails_admin'
  root to: "home#index"
  get 'userrole/index'
  get 'userrole/test'
  devise_for :user
  get "/test", to: "home#test"
  get '/become-partner', to: "home#become_a_partner"
  get '/home', to: "home#index"
  get '/contact', to: "home#contact"
  post "home/create", to: "home#create"
 
end
