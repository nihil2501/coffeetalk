Coffeetalk::Application.routes.draw do
  root to: redirect('/reading_list')

  resource :reading_list, only: [:show]

  resources :organization_memberships, only: [:create, :destroy]
  resources :group_subscriptions, only: [:create, :destroy]

  resources :organizations, shallow: true do
    resources :groups do
      resources :posts
    end
  end
end
