Rails.application.routes.draw do
  resources :apidocs, only: [:index]

  scope module: 'api' do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', :controllers => {
        :registrations => 'api/v1/devise_token_auth/registrations',
        :sessions      => 'api/v1/devise_token_auth/sessions'
      }
    end
  end
end
