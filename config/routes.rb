Rails.application.routes.draw do
  root 'pages#home'
  get "about", to: "pages#about"
  resources :articles ,path:  'blog'
 

  get "signup", to: "users#new"

  resources :users, except:[:new]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get '/auth/:provider/callback',to: 'sessions#omniauth'
  
end
