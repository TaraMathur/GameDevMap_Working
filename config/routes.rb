Rails.application.routes.draw do
  root 'companies#index'

  resources :companies do
    collection do
      get :filter
    end
  end

  get '/companies/:name', to: 'companies#index', as: 'test'
  get '/about', to: 'static_pages#about'
  get '/legal', to: 'static_pages#legal'
  get '/help', to: 'static_pages#help'
  get '/sponsor', to: 'static_pages#sponsor'

end
