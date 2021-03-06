Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :admin do
    get '/dashboard', to: 'base#dashboard'

    resources :academic_levels
    resources :applicants, only: [:index, :show, :new, :create, :edit, :update]
    resources :civil_statuses
    resources :contact_types
    resources :countries
    resources :documents
    resources :job_openings do
      resources :requirements
    end
    resources :languages
    resources :occupations
    resources :relationships
    resources :religions
    resources :skills
    resources :users

    root to: 'base#dashboard'
  end

  get '/about_us', to: 'pages#about_us'
  root to: 'pages#index'

end
