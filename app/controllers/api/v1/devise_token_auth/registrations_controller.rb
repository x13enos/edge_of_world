class Api::V1::DeviseTokenAuth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  include Api::V1::DeviseTokenAuth::RegistrationsDocumentation if Rails.env.development?
end

