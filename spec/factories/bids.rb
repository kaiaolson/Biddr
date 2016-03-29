FactoryGirl.define do
  factory :bid do
    association :auction, factory: :auction
    association :user, factory: :user
    amount  10
  end
end
