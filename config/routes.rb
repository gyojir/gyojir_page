Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :mangas do
    resources :votes, only: [:create, :destroy] do
      collection do
        post :good
        post :bad
      end
    end
  end

  namespace :admin do
    get '/', to: 'mangas#index'
    resources :mangas do
      resources :tags
    end
  end
end
