class Character < ApplicationRecord
  belongs_to :user
  has_many   :vital_attributes
end
