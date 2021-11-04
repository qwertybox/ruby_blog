Rails.application.routes.draw do
  root "articles#index" # set default page at localhost:3000

  resources :articles # заменяет два нижних маршрута так как включает их в себя и еще 5
  # get "/articles", to: "articles#index" # запросы GET /articles связываются с action index в ArticlesController

  # get "/articles/:id", to: "articles#show"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
