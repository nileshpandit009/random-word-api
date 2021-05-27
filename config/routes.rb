Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  get '/words', to: 'words#index'
  get '/words/swears', to: 'words#swears'
end
