Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get '/sign-up', to: 'users#new', as: 'sign_up'
  post '/sign-up', to: 'users#create'

  get '/home', to: 'welcome#home'
  post '/login', to: 'sessions#create'

end
