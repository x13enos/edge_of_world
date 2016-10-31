class Api::V1::BaseController < ApplicationController
  swagger_controller :registrations, "User Registration"

  swagger_api :create do
    summary "User Registration"
    param :form, :email, :string, :required, "Email"
    param :form, :password, :string, :required, "Password"
    param :form, :confirmation_password, :string, :required, "Confirmation password"
    response :unprocessable_entity, 'Registration was failed'
  end
end
