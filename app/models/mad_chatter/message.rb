module MadChatter
  class Message < ActiveRecord::Base
    belongs_to :room
    attr_accessible :html, :text
    belongs_to :author, class_name: 'User'

    validates_presence_of :room, :text, :author

    def html
      text if @html.nil?
    end

  end
end
