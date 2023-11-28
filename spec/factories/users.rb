FactoryBot.define do
  factory :user do
    username { 'TestUser' }
    email { 'test@example.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birth_date { '2000-01-01' }
    # 他の必要な属性もここに追加します
  end
end
