Rails.application.routes.draw do
  resources :mangas

  namespace :admin do
    resources :mangas do
      resources :tags
    end
  end
end
