Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :admin do
    get '/dashboard', to: 'base#dashboard'

    resources :academic_levels do
      resources :academic_degrees
    end
    resources :blood_types
    resources :citizenships
    resources :civil_statuses
    resources :contact_types
    resources :countries
    resources :documents
    resources :languages
    resources :relationships
    resources :religions
    resources :skills
    resources :skin_types
    resources :users
    resources :zodiacs

    root to: 'base#dashboard'
  end

  get '/about_us', to: 'pages#about_us'
  root to: 'pages#index'

end
