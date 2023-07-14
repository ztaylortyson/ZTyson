Rails.application.routes.draw do
  resources :clients
# 
# Scrapes
 get 'scrapes/index', to: 'scrapes#index'
 get 'scrapes/view', to: 'scrapes#view'

 
  

 # Admin 
  get 'admin/index'
  get 'admin/stored_lawsuits', to: 'admin#stored_lawsuits'
  get '/search', to: 'admin#search'
 
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "pages#home"
end
