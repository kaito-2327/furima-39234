FactoryBot.define do

  factory :item do
    title           {"タイトル"}
    price           {"50000"}
    explan          {"説明"}
    category_id     {"4"}
    situation_id    {"3"}
    prefecture_id   {"2"}
    take_id         {"2"}
    charge_id       {"2"}
    
    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end