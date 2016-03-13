Rails.application.routes.draw do

  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}

  get '/about_us', to: 'pages#about_us'
  root to: 'pages#index'

end
