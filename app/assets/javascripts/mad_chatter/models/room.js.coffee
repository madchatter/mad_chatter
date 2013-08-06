class MadChatter.Models.Room extends Backbone.Model

  urlRoot: -> MadChatter.mountPath + '/rooms'

  initialize: ->
    @messages = new MadChatter.Collections.Messages
    @messages.room = @

    es = new EventSource "#{MadChatter.mountPath}/protocols/sse/rooms/#{@get('id')}/subscribe"
    es.onmessage = (e) =>
      message = JSON.parse(e.data)
      @messages.add(message)
