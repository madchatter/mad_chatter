window.MadChatter =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {}
  FayeClient: (
    Faye.Logging.logLevel = 'debug'
    scheme = location.protocol
    host = location.hostname
    port = if location.port then ":#{location.port}" else ''
    path = '/mad_chatter/faye'
    new Faye.Client("#{scheme}//#{host}#{port}#{path}")
  )
  initialize: ->
    new MadChatter.Routers.Room
    Backbone.history.start(pushState: true)

$(document).ready ->
  MadChatter.initialize()
