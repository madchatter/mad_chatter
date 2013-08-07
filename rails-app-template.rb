# This file is a Rails appication template: http://guides.rubyonrails.org/rails_application_templates.html
# It will be used to automate the creation a test application.
# The README should match these steps.

gem 'thin'
gem 'mad_chatter', path: File.expand_path(File.dirname(__FILE__))
if Rails::VERSION::MAJOR == 3
  gem 'strong_parameters'
  # environment 'config.active_record.whitelist_attributes = false'
end

run 'bundle install'
rake 'mad_chatter:install:migrations'
rake 'db:migrate'

route 'mount MadChatter::RailsEngine => "/chat"'