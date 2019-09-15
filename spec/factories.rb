FactoryBot.define do
  factory :user do
    username { "kamafl" }
    email { "najasfded@gmail.com" }
    password { "blajdfns" }
    admin { true }
  end
end

FactoryBot.define do
  factory :room do
    name {"test1"}
  end
end

FactoryBot.define do
  factory :user_room do
    user_id { 3 }
    room_id { 6 }
  end
end

FactoryBot.define do
  factory :room_message do
    room_id { 144 }
    user_id { 4 }
    message { "Anything" }
  end
end
