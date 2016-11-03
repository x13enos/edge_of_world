class ApidocsController < ActionController::API
  include Swagger::Blocks

  swagger_root do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Edge of world'
      key :description, 'API for game'
      contact do
        key :name, 'Andres Sild'
      end
      license do
        key :name, 'MIT'
      end
    end
    key :host, 'localhost:5000'
    key :basePath, '/v1'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    Api::V1::DeviseTokenAuth::RegistrationsController,
    Api::V1::DeviseTokenAuth::SessionsController,
    Api::V1::CharactersController,
    User,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
