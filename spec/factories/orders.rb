FactoryBot.define do
  factory :order do
    user { nil }
    product { nil }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
