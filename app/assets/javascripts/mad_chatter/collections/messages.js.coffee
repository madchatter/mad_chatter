class MadChatter.Collections.Messages extends Backbone.Collection

  model: MadChatter.Models.Message,

  url: -> @room.url() + '/messages'
