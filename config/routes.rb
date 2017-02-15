Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/characters' => 'characters#index'
  get '/characters/new' => 'characters#new'
  post '/characters' => 'characters#create'
  get '/characters/:id' => 'characters#show', as: 'employee'
  get '/characters/:id/edit' => 'characters#edit'
  patch '/characters/edit' => 'characters#update'
  delete '/characters/:id' => 'characters#destroy' 



end
