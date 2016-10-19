module Api::V1::DeviseTokenAuth::SessionsDocumentation
  extend ActiveSupport::Concern

  included do
    swagger_controller :sessions, "User Sessions"

    swagger_api :create do
      summary "User Registration"
      param :form, :email, :string, :required, "Email"
      param :form, :password, :string, :required, "Password"
      response 401, "User wasn't authorized"
    end

  end
end

