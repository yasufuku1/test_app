Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
