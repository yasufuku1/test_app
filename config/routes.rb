Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users, controllers: {
    # ローカルに追加されたコントローラを参照する
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
  resources :tests
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
