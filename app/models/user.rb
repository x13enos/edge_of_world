class User < ApplicationRecord
  # Constants

  # Extensions
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User
  include Models::UserDocumentation

  # Associations(priority - belongs_to, has_one, has_many, HABTM)
  has_one :active_character, -> { where(:active => true) }, :class_name => 'Character'
  has_many :characters

  # Validations

  # Scopes

  private

  # Validations methods
end
