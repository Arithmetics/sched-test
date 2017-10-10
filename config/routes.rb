Rails.application.routes.draw do
  get 'standings/new'

  get 'static_pages/home'
  root 'application#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :standings

end
