SimplyTestManager::Application.routes.draw do
  root to: "stories#index"
  resources :story_comments
  resources :stories do
    put :change_state
  end
  resources :users
  resources :sessions

  delete "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"


end
