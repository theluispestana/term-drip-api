Rails.application.routes.draw do
  resources :colors
  resources :prompt_items
  resources :prompts
  resources :themes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
