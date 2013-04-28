Coffeetalk::Application.routes.draw do
  root to: redirect('/reading_list')
  resource :reading_list, only: [:show]

  join_actions = [:create, :destroy]

  resources :organization_memberships, only: join_actions
  resources :group_subscriptions,      only: join_actions

  modification_actions = [:new, :create, :edit, :update, :destroy]

  resources :organizations, only: modification_actions, shallow: true do
    resources :groups,      only: modification_actions do
      resources :posts
    end
  end
end
