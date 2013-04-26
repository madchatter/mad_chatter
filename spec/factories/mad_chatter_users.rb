# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mad_chatter_user, :class => 'User' do
    first_name "MyString"
    last_name "MyString"
    username "MyString"
  end
end
