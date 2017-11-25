Rails.application.routes.draw do
  get '/logout', to: 'mangas#logout'
  resources :mangas do
    resources :tags
  end
end
