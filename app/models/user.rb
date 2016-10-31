class User < ApplicationRecord
  # Constants

  # Extensions
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User
  include Models::UserDocumentation

  # Associations(priority - belongs_to, has_one, has_many, HABTM)
  has_many :characters

  # Validations

  # Scopes

  def character
    characters.find_by_active(true)
  end

  private

  # Validations methods
end
