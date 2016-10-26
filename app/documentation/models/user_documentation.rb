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

  swagger_schema :UserCreateInput do
    allOf do
      schema do
        key :'$ref', :User
      end
      schema do
        key :required, [:email, :password, :password_confirmation]
      end
    end
  end

  swagger_schema :UserSignInInput do
    allOf do
      schema do
        key :'$ref', :User
      end
      schema do
        key :required, [:email, :password]
      end
    end
  end

end
