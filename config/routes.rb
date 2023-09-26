Rails.application.routes.draw do
  resources :journals
  get 'pages/blah', to: 'pages#blah'
# DISCOVERY
  get 'discovery/srog'
  get 'discovery/rfp', to: 'discovery#rfp'
  get 'discovery/frog_e'
  get 'discovery/frog_g'
  get 'discovery/rfa'
  get 'discovery/depo_pmk'
  get 'discovery/depo_indiv'
  get 'discovery/sep_statement'
  get 'discovery/proposed_order'
  get 'discovery/notice_of_motion'
  get 'discovery/atty_decl'
  get 'discovery/memo_panda'
#resources :jcfs
  resources :client_lawsuits
  resources :attorney_lawsuits
  resources :attorneys
  resources :lawsuits

  resources :ncfs
  root "pages#home"
  resources :clients
# lawsuits
 get 'lawsuits/ulawsuits' 
# Scrapes
 get 'scrapes/index', to: 'scrapes#index'
 get 'scrapes/view'

 # Judicial Counsel Forms, jcfs
 get 'jcfs/cms'
 get 'jcfs/frog_general'
 get 'jcfs/frog_employment'
 get 'jcfs/rfa'
 get 'jcfs/pes' # pos_electronic
 get 'jcfs/ex_parte'
 get 'jcfs/dismissal'
  

 # Admin 
  get 'admin/index'
  get 'admin/stored_lawsuits', to: 'admin#stored_lawsuits'
  get '/search', to: 'admin#search'
 
  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  get "pages/clt"
  get "pages/ul"
  get "pages/case_info"
  get "pages/cltenvelope"
  get "pages/attyenvelope"
  get 'pages/attycorres'

# Pleadings 
  get 'pleadings/generic', to: 'pleadings#generic'
  get 'pleadings/supp_interrogatories', to: 'pleadings#supp_interrogatories'
  get 'pleadings/decl_atty', to: 'pleadings#decl_atty'

# Responses
  get 'responses/verification', to: 'responses#verification'



end
