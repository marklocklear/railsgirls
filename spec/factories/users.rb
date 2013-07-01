# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "MyString"
    password "MyString"
    password_confirmation "MyString"
  end
end
