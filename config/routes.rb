Rails.application.routes.draw do

  devise_for :users, path:'', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  resources :portfolios, except: [:show, :edit] do
    put :sort, on: :collection
  end
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'portfolio/:id/edit', to: 'portfolios#edit', as: 'portfolio_edit'
  get 'portfolios/data_engineering', to: 'portfolios#data_engineering'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  root to: 'pages#home'


end
