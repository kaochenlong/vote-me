FactoryBot.define do
  factory :order do
    recipient { "MyString" }
    phone { "MyString" }
    address { "MyString" }
    note { "MyText" }
    state { "MyString" }
    deleted_at { "2019-06-06 12:08:17" }
    user { nil }
  end
end
