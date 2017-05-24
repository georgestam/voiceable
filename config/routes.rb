Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'registrations' }

  root to: "pages#index"
  
  get 'about' => "pages#about"
  get 'contribute' => "pages#contribute"
  get 'contact' => "pages#contact"
  get 'questions' => "pages#questions"
  
  namespace :api, defaults: { format: :json } do
    namespace :respira do
      namespace :v1 do
        resources :recordings, only: %i[index show update]
      end
    end
  end
  
end
