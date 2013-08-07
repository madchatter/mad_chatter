module MadChatter
  class Room < ActiveRecord::Base

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name
    end
    
    has_many :messages
    belongs_to :owner, class_name: 'User'
  end
end
