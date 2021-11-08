Rails.application.routes.draw do
  root "articles#index" # set default page at localhost:3000

  resources  :articles #, only: %[] # заменяет два нижних маршрута так как включает их в себя и еще 5 only or except
  # get "/articles", to: "articles#index" # запросы GET /articles связываются с action index в ArticlesController
  resources :authors
  # get "/articles/:id/sub_id", to: "articles#show" # get params
  # put patch
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# get put post delete patch
# get parameters
# post - params, body