class MadChatter.Collections.Rooms extends Backbone.Collection

  model: MadChatter.Models.Room,

  url: -> MadChatter.mountPath + '/rooms'
