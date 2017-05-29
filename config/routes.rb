Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }
  
  namespace :api, defaults: { format: :json } do
    namespace :respira do
      namespace :v1 do
        resources :recordings, only: %i[index show update create]
      end
    end
  end
  
end
