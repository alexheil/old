Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms' => 'static_pages#terms'
  get 'about' => 'static_pages#about'

  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations", confirmations: "admins/confirmations",  unlocks: "admins/unlocks"}

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :admins, controller: 'admins/admins', only: :show

  resources :categories, controller: 'categories/categories' do
    resources :groups, controller: 'categories/groups', except: :index do
      resources :posts, controller: 'categories/posts', except: :index
    end
  end

  resources :emails, controller: 'emails/emails', only: [:create, :destroy] do 
    member do
      get :unsubscribe, controller: 'emails/emails'
    end
  end

end
