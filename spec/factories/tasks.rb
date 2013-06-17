# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    idea
    name "MyString"
    team_members "MyText"
    notes "MyText"
    completed false
  end
end
