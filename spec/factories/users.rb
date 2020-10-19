FactoryBot.define do
  factory :user do
    nickname              { 'abe' }
    email                 { 'kkk@gmail.com' }
    password              { '00000a' }
    password_confirmation { password }
    first_name            { 'あべ' }
    last_name             { 'あべこ' }
    first_name_kana       { 'アベ' }
    last_name_kana        { 'アベコ' }
    birthday              { Date.new(2000, 11, 12) }
  end
end
