Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'

  resources :mangas

  namespace :admin do
    resources :mangas do
      resources :tags
    end
  end
end
