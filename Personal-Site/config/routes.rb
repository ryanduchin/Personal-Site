Rails.application.routes.draw do
  root to: 'static_pages#index'
  post '/send_mail', to: 'contact#send_mail'
  get '/send_mail', to: 'static_pages#index'
end
