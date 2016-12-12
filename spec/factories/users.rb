FactoryGirl.define do
  factory :users do
    name "Test User"
    email "test@example.com"
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now

    trait :admin do
      role 'admin'
    end
  end
end
