FactoryBot.define do
  factory :order do
    association :user
    association :item # または :item など、実際のモデル名に応じて変更してください。
    token { "tok_abcdefghijk00000000000000000" }
  end
end

