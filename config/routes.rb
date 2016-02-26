Rails.application.routes.draw do
  
  root 'mcsubscribe#index'
  post 'mcsubscribe/subscribe' => 'mcsubscribe#subscribe'
  
end