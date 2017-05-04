Rails.application.routes.draw do
  devise_for :users
	resources :jobs
	root 'jobs#index'

	 devise_scope :user do
	 	get '/users/sign_out' => 'devise/sessions#destroy'

    authenticated :user do
      root :to => 'jobs#index'
    end
    unauthenticated :user do
      root :to => 'jobs#index', as: :unauthenticated_root
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
