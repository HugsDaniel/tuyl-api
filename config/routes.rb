Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'sign_up'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             },
             defaults: { format: :json }

  namespace :api do
    namespace :v1 do
      resources :activities, only: [:index, :create]
      resources :skills,     only: :index
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
