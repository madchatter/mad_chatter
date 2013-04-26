class MadChatter.Routers.Room extends Backbone.Router

  routes:
    'rooms/:id': 'show'

  show: (room_id)->
    messages = new MadChatter.Collections.Messages(room_id: room_id)
    view = new MadChatter.Views.Room(collection: messages)
    messages.subscribe (new_message)->
      view.addMessage(new_message)
