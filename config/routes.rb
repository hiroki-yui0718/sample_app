Rails.application.routes.draw do
  root 'statics_pages#home'
  get  '/help',    to: 'static_pages#help', as: 'helf'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/login',to:'sessions#new'
  post '/login',to:'sessions#create'
  get '/auth/twitter/callback',to:'sessions#twitter_create'
  delete '/logout',to:'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
