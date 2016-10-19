class Api::V1::DeviseTokenAuth::SessionsController < DeviseTokenAuth::SessionsController
  include Api::V1::DeviseTokenAuth::SessionsDocumentation if Rails.env.development?
end
