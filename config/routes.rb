Rails.application.routes.draw do
  devise_for :authors, controllers: { sessions: 'authors/sessions', registrations: 'authors/registrations' }

  root to: "home#index"
  
  get '/' => 'home/index'
  
  get '/authors/sign_up' => 'registrations#new'
  
  get '/authors/sign_in' => 'sessions#new'

  get '/read/:id' => 'home#read'

  scope module: 'authors' do
    resources :posts do
      resources :elements
    end
  end
end
