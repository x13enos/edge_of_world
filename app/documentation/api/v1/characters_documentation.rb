module Api::V1::CharactersDocumentation
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_path '/characters' do
      operation :post do
        key :description, 'Create new character for user'
        key :tags, [
          'characters'
        ]

        parameter :name => "access-token", :in => :header, :description => 'Access token(auth)', :required => true
        parameter :name => :client, :in => :header, :description => 'Client(auth)', :required => true
        parameter :name => :expiry, :in => :header, :description => 'Expiry(auth)', :required => true
        parameter :name => :uid, :in => :header, :description => 'Uid(auth)', :required => true


        response 200 do
          key :description, 'Success'
        end

        response 422 do
          key :description, "You have the active character"
        end

        response 401 do
          key :description, "User wasn't authorized"
        end
      end
    end

  end
end

