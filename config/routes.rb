MoodyOn::Application.routes.draw do
  

  authenticated :user do
    resources :events
    resources :reasons
    
    resources :moods 
      resources :sub_moods
    
    match "show_sub_moods/:id" => "home#show_sub_moods"
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end