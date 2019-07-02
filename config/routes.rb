Rails.application.routes.draw do

  resources :portfolios
  get 'pages/about'
  get 'pages/contact'
  resources :blogs
  root to: 'pages#home'

end
