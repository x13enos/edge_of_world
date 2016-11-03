FactoryGirl.define do
  factory :character do
    active false
    association :user, factory: :user
  end
end
