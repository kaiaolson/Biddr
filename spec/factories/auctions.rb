FactoryGirl.define do
  factory :auction do
    sequence(:title)     {|n| "#{Faker::Company.bs}-#{n}" }
    sequence(:details)   {|n| "#{Faker::Lorem.paragraph}-#{n}" }
    end_date             60.days.from_now
    reserve_price        500
    association :user, factory: :user
  end
end
