Rails.application.routes.draw do
  root "application#home"
  namespace :api do
    namespace :v1 do
      resources :index_contents, only: [:create, :index]
    end
  end
end
