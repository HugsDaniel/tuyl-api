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
      resources :activities,      only: [:index, :create]
      resources :skills,          only: :index
      resources :user_skills,     only: :index do
        collection do
          put :update_multiple
        end
      end
      resources :user_activities, only: [:create, :show] do
        member do
          put :done
        end
      end
      get :dashboard, to: 'users#dashboard'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
