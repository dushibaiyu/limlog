Rails.application.routes.draw do
  root 'pages#home'

  get '/sitemap', to: 'pages#sitemap', defaults: { format: 'xml' }
  get '/rss',     to: 'pages#rss',     defaults: { format: 'xml' }

  get    '/signup', to: 'users#new'
  post   '/signup', to: 'users#create'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :posts do
    resources :replies, shallow: true
  end

  resources :tags,       path: 'tag'
  resources :categories, path: 'category'
  resources :pages,      path: '', except: [:index]

  resources :users, only: [:show, :edit, :update, :destroy]
end
