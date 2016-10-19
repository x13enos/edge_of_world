module Api::V1::DeviseTokenAuth::RegistrationsDocumentation
  extend ActiveSupport::Concern

  included do
    swagger_controller :registrations, "User Registration"

    swagger_api :create do
      summary "User Registration"
      param :form, :email, :string, :required, "Email"
      param :form, :password, :string, :required, "Password"
      param :form, :password_confirmation, :string, :required, "Confirmation password"
      response :unprocessable_entity, 'Registration was failed'
    end

  end
end

