# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    topic nil
    name "MyString"
    user nil
    description "MyString"
  end
end
