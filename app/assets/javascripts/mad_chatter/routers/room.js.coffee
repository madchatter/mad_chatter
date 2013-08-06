class MadChatter.Routers.Room extends Backbone.Router

  routes:
    'rooms/:id': 'show'

  show: (room_id)->
    room = new MadChatter.Models.Room(id: room_id)
    view = new MadChatter.Views.Room(model: room)
