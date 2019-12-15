Rails.application.routes.draw do
  root 'static_pages#home'
  get '/tools', to: 'static_pages#tools'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/link', to: 'static_pages#link'

  if Rails.env == 'production'
    get 'sitemap.xml', to: redirect(Cloudinary::Utils.cloudinary_url("sitemap.xml", :resource_type => :raw))
  end

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
