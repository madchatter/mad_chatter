module MadChatter
  class Room < ActiveRecord::Base
    attr_accessible :name
    has_many :messages
    belongs_to :owner, class_name: 'User'
  end
end
