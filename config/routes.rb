Rails.application.routes.draw do
  root to: 'pages#home'
  resources :posts, defaults: { format: 'json' }, only: %i(index show create)
end
