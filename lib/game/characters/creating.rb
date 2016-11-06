class Game::Characters::Creating
  include ActiveModel::Validations

  attr_accessor :user, :character

  validate :only_one_active_character

  def initialize(user)
    @user = user
    @character = nil
  end

  def perform
    if valid?
      create_character
    else
      false
    end
  end

  private

  def create_character
    build_character
    add_vital_attributes_to_character
    save_character
  end

  def build_character
    @character = user.characters.build
  end

  def add_vital_attributes_to_character
    VitalAttribute::TYPES.each do |type|
      @character.vital_attributes.build(vital_attribute_params(type))
    end
  end

  def save_character
    @character.save
  end

  def vital_attribute_params(type)
    {
      :name => type,
      :max_value => VitalAttribute::MAX_VALUE[type],
      :value => VitalAttribute::MAX_VALUE[type]
    }
  end

  def only_one_active_character
    if user.active_character
      errors.add(:base, :just_one_active_character)
    end
  end
end

