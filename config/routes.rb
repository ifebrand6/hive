Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/application'
  get 'dashboard/talents'
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
end
