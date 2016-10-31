module Models::UserDocumentation
  include Swagger::Blocks

  swagger_schema :User do
    property :email do
      key :type, :string
    end
    property :password do
      key :type, :string
    end
    property :password_confirmation do
      key :type, :string
    end
  end
end
