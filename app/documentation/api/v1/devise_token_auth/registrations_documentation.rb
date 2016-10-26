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

        parameter do
          key :name, :user
          key :in, :body
          key :description, 'Add user to the store'
          key :required, true
          schema do
            key :'$ref', :UserInput
          end
        end

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

