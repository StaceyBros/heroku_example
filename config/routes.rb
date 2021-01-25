Rails.application.routes.draw do
  get 'mixtapes/new'
  get 'session/new'
  root :to => 'pages#home'
  resources :users, :only => [:new, :create, :index]

  #HTTP verbs
  get '/login' => 'session#new' #one session on user LogIn
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :mixtapes, :only => [:new, :create]
end
