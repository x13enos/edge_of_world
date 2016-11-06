FactoryGirl.define do
  factory :vital_attribute do
    name "health"
    value 1
    max_value 1
    association :character, :factory => :character
  end
end
