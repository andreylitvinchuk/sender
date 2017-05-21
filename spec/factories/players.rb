FactoryGirl.define do
  factory :player do
    name { "PlayerName-#{rand(999999)}" }
    vk_id { "#{rand(999999)}" }
    level { rand(20) }
    last_visit "2017-05-21 10:30:27"
    sequence(:paid, &:even?)
  end
end
