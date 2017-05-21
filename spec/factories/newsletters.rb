FactoryGirl.define do
  factory :newsletter do
    text "MyText"
    filters [{
               prop_name: 'level',
               logic: 'qteq',
               value: '10'
             }, {
               prop_name: 'level',
               logic: 'lteq',
               value: '12'
             }]
    start_at "2017-05-21 01:13:59"
  end
end
