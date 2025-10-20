Rails.application.routes.draw do
  # Health check için varsayılan rota
  get "up" => "rails/health#show", as: :rails_health_check

  # API Rotaları
  namespace :api do
    namespace :v1 do
      # Post modelinin CRUD operasyonlarını JSON formatında sunar
      resources :posts, only: [:index, :show] 
      # Diğer modeller için de rota eklenebilir.
    end
  end
end