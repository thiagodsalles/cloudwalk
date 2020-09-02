Rails.application.routes.draw do
  resources :file_upload, only: %i[create]
end
