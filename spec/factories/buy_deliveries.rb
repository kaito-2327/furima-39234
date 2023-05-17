FactoryBot.define do
  factory :buy_delivery do
    post_code { '123-1234'}
    prefecture_id { 3 }
    municipality { '横浜市緑区' }
    address { '3-4' }
    bldg { '青山ビル' }
    phone { '09012341234' }
    token {"tok_abcdefghijk00000000000000000"}

    association :user_id
    association :item_id
  end
end