Rails.application.routes.draw do
  get 'admin/index'
  
  scope :api, defaults: { format: :json } do
    devise_for :user, controllers: { 
                           sessions: 'user/sessions',
                           registrations: 'user/registrations' },

                       path_names: { 
                           sign_in: :login,
                           sign_up: :sign_up
                        }
  end
  get '/home' , to: 'home#index'
  get '/users' , to: 'users#index'

  namespace :hostel do
   resources 'hostels', path: '/', only: [:index, :create, :update, :destroy]
  end

  resources :rooms , path: '/hostel/:id/room', only: [:create, :update, :destroy]
  resources :protocols , path: '/hostel/:id/protocol' , only: [:create, :update, :destroy]
  

  get 'admin/hostels' , :to => 'admin#hostels'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
