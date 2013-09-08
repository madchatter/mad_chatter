%w{
  redis
  jquery-rails
  momentjs-rails
  backbone-on-rails
  bootstrap-sass
  mad_chatter/protocols/sse
  mad_chatter/rails_engine
}.each { |dependency| require dependency }

module MadChatter
  
end
