Rails.application.routes.draw do
  resources :companies

  get 'static_pages/about'
  get 'static_pages/legal'
  get 'static_pages/help'
  get 'static_pages/sponsor'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :countries , only: [:new, :create, :index]

#	root 'static_pages#mygraph'
	root 'companies#index'

end
