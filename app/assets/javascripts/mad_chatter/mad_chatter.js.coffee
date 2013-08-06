window.MadChatter =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  Data: {}
  initialize: (@mountPath)->
    if @mountPath.slice(-1) == '/'
      @mountPath = @mountPath.slice(0,-1) # remove trailing slash
    router = new MadChatter.Routers.Room
    Backbone.history.start(pushState: true)
