Rails.application.routes.draw do
  resources :mazes, :only => [:index, :show, :new, :create, :destroy] do
    resources :walls, :only => [:index]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'mazes#index'
end
