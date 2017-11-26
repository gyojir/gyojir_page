Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :mangas

  namespace :admin do
    resources :mangas do
      resources :tags
    end
  end
end
