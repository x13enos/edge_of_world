class Character < ApplicationRecord
  belongs_to :user

  validate :only_one_active_character, :on => :create

  private

  def only_one_active_character
    if user.character
        errors.add(:base, I18n.t('models.users.validations.base.just_one_character'))
    end
  end
end
