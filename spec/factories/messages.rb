# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :message do
    from_user_id 1
    to_user_id 1
    content "MyText"
  end
end
