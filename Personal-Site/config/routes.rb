Rails.application.routes.draw do
  root to: 'static_pages#index'
  post '/send_mail', to: 'contact#send_mail'
end
