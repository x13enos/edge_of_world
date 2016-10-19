Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
