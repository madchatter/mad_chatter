# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mad_chatter_message, :class => 'Message' do
    text "MyString"
    html "MyString"
    references ""
  end
end
