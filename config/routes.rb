Rails.application.routes.draw do
  # resources :blog
  get 'blog'  => 'blog#index'
  get 'blog/single_post/:id' => 'blog#single_post', :as => 'single_post'
  post 'blog/add_comment' => 'blog#add_comment'
  # get '/blog/:id', to: 'blog#show'
  resources :posts 
  resources :comments, only: [:create,:show]
  resources :get_experts, only: [:new,:create], path: 'book-an-agriculture-expert_service'
  get "/admin", to: "admin#index"
  get 'admin/application'
  get 'admin/talents'
  get 'admin/customers_requests'
  get 'admin/customer_talent_requests/:id' => 'admin#customer_talent_requests', :as => 'talent_requests'
  get 'admin/customer_requests/:id' => 'admin#customer_requests', :as => 'customer_requests'
  get 'admin/talent_assignment/:id' => 'admin#talent_assignment', :as => 'talent_assignment'
  post "admin/finalize_user_request", to: "admin#finalize_user_request"
  get 'onboard/:id' => 'expert_applications#accept_application', :as => 'onboard'
  resources :expert_applications, path: 'application'
  mount RailsAdmin::Engine => '/super_admin', as: 'rails_admin'
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
