MoodyOn::Application.routes.draw do
  

  authenticated :user do
    resources :events
    resources :reasons
    
    resources :moods 
      resources :sub_moods
    
    match "show_sub_moods/:id" => "home#show_sub_moods"
    root :to => 'home#index'
  end
  
  scope "(:locale)" do
  devise_for :users, 
    :controllers => { 
      :sessions           => 'devise/sessions', 
      :registrations      => 'devise/registrations', 
      :confirmations      => 'devise/confirmations', 
      :passwords          => 'devise/passwords',
      :omniauth_callbacks => 'users/omniauth_callbacks'
    },
    :path => '',
    :path_names => {:sign_in => 'users/sign_in', :sign_out => 'users/sign_out', :sign_up => 'users/sign_up'}
  end
  
  resources :users
  
  root :to => "home#index"
end