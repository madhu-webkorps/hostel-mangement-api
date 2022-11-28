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
  
  resources 'hostels'
  
  resources :rooms , path: '/hostel/:id/rooms', only: [:index, :create]
  resources :rooms, only: [:update, :destroy]

  resources :protocols , path: '/hostel/:id/protocols' , only: [:index, :create]
  resources :protocols , only: [:update, :destroy]

  
  resources :booking , only: [:index, :create]
    get 'booking/success', to: 'booking#success'
    get 'booking/canceled', to: 'booking#canceled'
    get 'booking/pay_fees', to: 'booking#pay_fee'
    
  

  get 'admin/hostels' , :to => 'admin#hostels'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
