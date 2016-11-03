module Api::V1::DeviseTokenAuth::RegistrationsDocumentation
  extend ActiveSupport::Concern
  include Swagger::Blocks


  included do
    swagger_path '/auth' do
      operation :post do
        key :description, 'Create User in the System'
        key :tags, [
          'users'
        ]

        parameter :name => :email, :in => :query, :description => 'Email', :required => true
        parameter :name => :password, :in => :query, :description => 'Password', :required => true
        parameter :name => :password_confirmation, :in => :query, :description => 'Password Confirmation', :required => true

        response 200 do
          key :description, 'Success'
        end

        response 422 do
          key :description, 'User params are invalid'
        end
      end
    end

  end
end

