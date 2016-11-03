module Api::V1::DeviseTokenAuth::SessionsDocumentation
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/auth/sign_in' do
      operation :post do
        key :description, 'Login user into the app'
        key :tags, [
          'users'
        ]

        parameter :name => :email, :in => :query, :description => 'Email', :required => true
        parameter :name => :password, :in => :query, :description => 'Password', :required => true

        response 200 do
          key :description, 'Success'
        end

        response 401 do
          key :description, "User wasn't authorized"
        end
      end
    end

  end
end

