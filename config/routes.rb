Rails.application.routes.draw do

  get 'contact' => 'contact#index'

  get 'about' => 'about#index'

  get 'blog' => 'blog#index'

  get 'companies' => 'company#index'

  get 'jobs' => 'job#index'

  namespace :user do
    resources :add_resumes
    resources :password_reset
  end
  scope module: 'user' do

    get 'settings'=>'settings#index'
    get 'profile'=>'profile#index'

    get '/verify/:id' => 'session#verify', as: 'verify'

    get '/login' => 'session#index'
    post '/login' => 'session#create'
    get '/logout' => 'session#destroy'

    get '/signup' => 'session#signup'
    post '/signup' => 'session#new'
  end
  get 'user' => 'user#index'

  root 'front_end#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
