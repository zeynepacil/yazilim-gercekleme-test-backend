Rails.application.routes.draw do
  # Health check için varsayılan rota
  get "up" => "rails/health#show", as: :rails_health_check

  # API Rotaları
  namespace :api do
    namespace :v1 do
      # Post modelinin CRUD operasyonlarını JSON formatında sunar
      resources :posts, only: [:index, :show] 
      # Diğer modeller için de rota eklenebilir.
      resources :shifts, only: [:index] # Vardiyaları listelemek için
      resources :schedules, only: [:index, :create] # Çizelgeyi listelemek ve yeni çizelge eklemek için
    end
  end
end