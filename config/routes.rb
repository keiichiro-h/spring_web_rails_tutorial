Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/home'
  get '/help', to: 'static_pages#help'
  get '/questions', to: 'static_pages#questions'
  get '/signup', to: 'users#new'
end