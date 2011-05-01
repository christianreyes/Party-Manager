PartyManager::Application.routes.draw do
  root :to => 'home#index'
  
  match 'index' => 'home#index', :as => :index

  match 'about' => 'home#about', :as => :about

  match 'contact' => 'home#contact', :as => :contact

  match 'privacy' => 'home#privacy', :as => :privacy

  match 'dashboard' => 'home#dashboard', :as => :dashboard
  
  match 'host/edit' => 'hosts#edit', :as => :edit_current_host

  match 'signup' => 'hosts#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login
  
  match 'rsvp/:invite_code', :via => :get , :to => 'invitations#rsvp', :as => 'rsvp'
  
  #match 'rsvp/:invite_code', :via => :post , :to => 'invitations#rsvp_create', :as => 'rsvp_create'

  resources :sessions

  resources :hosts

  resources :gifts

  resources :invitations

  resources :parties

  resources :guests

  resources :locations

end
