class Character < ApplicationRecord
  belongs_to :user

  validate :only_one_active_character, :on => :create

  private

  def only_one_active_character
    if user.active_character
        errors.add(:base, :just_one_active_character)
    end
  end
end
