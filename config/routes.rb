Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'articles#index' # set default page at localhost:3000

  resources :articles, :authors #, only: %[] # заменяет два нижних маршрута так как включает их в себя и еще 5 only or except

  resources :articles do
    resources :comments
  end

  get '/*other', to: 'application#not_found'
  # get "/articles", to: "articles#index" # запросы GET /articles связываются с action index в ArticlesController
  # get "/articles/:id/sub_id", to: "articles#show" # get params
  # get "/authors/", to: ""
  # put patch
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:new, :create]
  # get '/login', to: 'sessions#login'
  # post '/login', to: 'sessions#create'
  # get '/welcome', to: 'sessions#welcome'
  # delete '/logout', to: 'sessions#destroy'
  # get '/authorized', to: 'sessions#page_requires_login'
end
# get put post delete patch
# get parameters
# post - params, body