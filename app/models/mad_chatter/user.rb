require 'bcrypt'

module MadChatter
  class User < ActiveRecord::Base

    if Rails::VERSION::MAJOR == 3
      attr_accessible :first_name, :last_name, :username, :password, :password_confirmation
    end

    validates :username, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true

    has_many :rooms
    has_many :messages

    include BCrypt

    def password
      @password ||= Password.new(encrypted_password)
    end

    def password=(new_password)
      @password = Password.create(new_password)
      self.encrypted_password = @password
    end

    def self.authenticate(username, password)
      if user = find_by_username(username)
        user if user.password == password
      end
    end

  end
end
