FactoryGirl.define do
  factory :newsletter do
    text "MyText"
    filters [{
               prop_name: 'level',
               logic: 'qteq',
               value: '1'
             }, {
               prop_name: 'level',
               logic: 'lteq',
               value: '10'
             }]
    sequence(:start_at) { |n| Time.now + n.minutes }
  end
end
