Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  # get 'users/new'
  get 'pages/help'
  #get 'pages/help',to:'pages#help'という形が本来の形だが内容が重複しているため省略している。
  # get 'pages/index'
  root 'pages#index'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get    '/login',  to: 'sessions#new'
  # sessions#newはsessionscontrolerのnewアクションを読み取っている。
  # つまりcontrolを省略している。
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  resources :users
  # resources:コントローラー名
  resources :topics

  get 'favorites/index', to: "favorites#index"
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'


  get 'comments/index'
  post '/comments', to: 'comments#create'

  resources :comments

end
