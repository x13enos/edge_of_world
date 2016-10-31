module Api::V1::DeviseTokenAuth::SessionsDocumentation
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/auth/sign_in' do
      operation :post do
        key :description, 'Login user into the system'
        key :tags, [
          'users'
        ]

        parameter do
          key :name, :user
          key :in, :body
          key :description, 'Sign in operation'
          key :required, true
          schema do
            key :'$ref', :UserInput
          end
        end

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

