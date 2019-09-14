
FactoryBot.define do
  factory :user do
    username { "Nick" }
    email { "najed@gmail.com" }
    password { "blah" }
    admin { true }
  end
end

FactoryBot.define do
  factory :room do
    name {"test1"}
  end
end
