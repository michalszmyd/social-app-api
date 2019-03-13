Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'api/v1/sessions' }, path: 'api/v1/users'

  namespace :api do
    namespace :v1 do
      resources :posts do
        resources :comments, only: %i[index create]
      end
      resources :profiles, only: :show do
        collection do
          get :my_profile
        end
      end
    end
  end
end
