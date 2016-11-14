FactoryGirl.define do
  factory :users do
    name "Test User"
    email "test@example.com"
    password "please123"

    trait :admin do
      role 'admin'
    end

  end
end
