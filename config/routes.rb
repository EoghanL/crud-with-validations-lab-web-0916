Rails.application.routes.draw do
  get "/destroy", to: "songs#destroy"
  resources :songs

end
