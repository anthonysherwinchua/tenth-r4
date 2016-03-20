Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  namespace :admin do
    get '/dashboard', to: 'base#dashboard'

    resources :users, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :academic_degrees

    root to: 'base#dashboard'
  end

  get '/about_us', to: 'pages#about_us'
  root to: 'pages#index'

end
