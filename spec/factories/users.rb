FactoryBot.define do
  factory :user do
    nickname              {"あア漢字"}
    email                 {Faker::Internet.free_email}
    password              {"1a"+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"あア漢字"}
    first_name            {"あア漢字"}
    last_name_kana        {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birthday              {Faker::Date.between_except(from: '1930-1-1', to: 5.year.ago, excepted: Date.today)}
  end
end