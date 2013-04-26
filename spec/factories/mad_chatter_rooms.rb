# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mad_chatter_room, :class => 'Room' do
    name "MyString"
  end
end
