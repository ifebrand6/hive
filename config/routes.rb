Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new'
  get 'posts/edit'
  get 'posts/delete'
  # get 'get_experts#index', path: 'requestexpert'
  resources :get_experts, path: 'requestexpert'
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
  resources :expert_applications, path: 'application'
   mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
