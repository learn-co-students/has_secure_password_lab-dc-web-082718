Rails.application.routes.draw do
  resource :user, only: [:create]

  get '/', to: "users#new", as: "new_user"
  post '/', to: "users#create"
  get '/welcome/:id', to: "users#welcome", as: "welcome"
  post '/login', to: "sessions#create"
end
