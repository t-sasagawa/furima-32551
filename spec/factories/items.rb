FactoryBot.define do
  factory :item do
    title         {"あア漢字"}
    text          {"あア漢字"}
    category_id   {1}
    state_id      {2}
    fee_id        {1}
    prefecture_id {2}
    days_ship_id  {1}
    price         {345}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test.jpg'), filename: 'test.jpg')
    end
  end

end
