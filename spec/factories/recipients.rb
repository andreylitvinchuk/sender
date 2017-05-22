FactoryGirl.define do
  factory :recipient do
    player
    newsletter
    sent false
  end
end
