FactoryBot.define do
  factory :record_address do
    postal_code           { '123-4567' }
    prefecture_id         { 1 }
    city                  { '東京都' }
    house_number          { '1-1' }
    building_name         { '東京ハイツ' }
    phone_number          { '09000000000' }
    user_id               { 1 }
    item_id               { 1 }
    token                 { 'tok_abcdefghijk00000000000000000' }
  end
end
