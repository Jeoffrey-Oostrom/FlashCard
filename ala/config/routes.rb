Rails.application.routes.draw do
  resources :visitors
  resources :questions
  resources :subjects
  resources :practice
  resources :exams

  resources :login do
    collection do
      post '/logging', :as => :logging, action: 'create', controller: 'login'
    end
  end

  root 'visitors#new'
  get 'log_out' => 'login#destroy', :as => 'log_out'
  get 'log_in' => 'login#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'logging' => 'login#create', :as => 'logging'
  get 'overview' => 'visitors#overview', :as => 'overview'
  get 'create_practice' => 'practice#create', :as => 'create_practice'
end
