FactoryBot.define do
  factory :comment do
    text {"あア漢字"}

    association :user
    association :item
  end
end
