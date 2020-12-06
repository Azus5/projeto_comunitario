Rails.application.routes.draw do
  devise_for :professor, skip: :all
  devise_for :student, skip: :all
  root 'application#index'

  devise_scope :student do
    namespace :students do
      get '/credentials', to: 'registrations#new'

      post '/', to: 'registrations#create'

      post '/sign_in', to: 'sessions#create'
      delete '/:id', to: 'sessions#destroy'
    end
  end

  devise_scope :professor do
    namespace :professors do
      get '/credentials', to: 'registrations#new'

      get '/dashboard', to: 'dashboard#index'

      post '/', to: 'registrations#create'

      post '/sign_in', to: 'sessions#create'
      delete '/:id', to: 'sessions#destroy'
    end
  end

  namespace :professors do
    get '/internships', to: 'internships#index'

    get '/internships/new', to: 'internships#new'
    get '/internships/:id', to: 'internships#edit'
    post '/internships', to: 'internships#create'
    post '/internships/:id', to: 'internships#update'
    delete '/internships/:id', to: 'internships#destroy'
  end
end
