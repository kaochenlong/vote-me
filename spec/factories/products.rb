FactoryBot.define do
  factory :product do
    title { "MyString" }
    price { "9.99" }
    description { "MyText" }
    is_available { false }
  end
end
