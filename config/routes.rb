Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  devise_for :admins, controllers: { sessions: "admins/sessions", passwords: "admins/passwords", registrations: "admins/registrations", confirmations: "admins/confirmations",  unlocks: "admins/unlocks"}

  devise_scope :admin do
    get "sign_out", to: "admins/sessions#destroy"
  end

  resources :categories, controller: 'categories/categories' do
    resources :groups, controller: 'categories/groups' do
      resources :posts, controller: 'categories/posts'
    end
  end

end
