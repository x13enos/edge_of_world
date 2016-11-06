class VitalAttribute < ApplicationRecord
  TYPES = ['health']
  MAX_VALUE = {'health' => 100}

  belongs_to :character

  validates :name, :max_value, :presence => true
  validates :name, :inclusion => { :in => TYPES }
end
