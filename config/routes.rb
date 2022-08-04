Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'lists#index'
  get "bookmarks/id", to: "bookmarks#destroy"
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    resources :bookmarks, only: [:new, :create, :destroy]
    resources :reviews, only: :create
  end

  resources :bookmarks, only: :destroy
  resources :reviews, only: :destroy
end



#   resources :lists, except: [:edit, :update] do
#     resources :bookmarks, only: [:new, :create]
#     resources :reviews, only: :create
#   end
#   resources :bookmarks, only: :destroy
#   resources :reviews, only: :destroy
# end
