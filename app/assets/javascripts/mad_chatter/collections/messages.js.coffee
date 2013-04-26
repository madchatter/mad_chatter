class MadChatter.Collections.Messages extends Backbone.Collection

  initialize: (options)->
    @room_id = options.room_id

  subscribe: (callback)->
    MadChatter.FayeClient.subscribe "/rooms/#{@room_id}", (data)->
      message = new MadChatter.Models.Message(data)
      callback(message)