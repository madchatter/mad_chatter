%w{
  jquery-rails
  backbone-on-rails
  bootstrap-sass
  mad_chatter/engine
}.each { |dependency| require dependency }

module MadChatter
end
