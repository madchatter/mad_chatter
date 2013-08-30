class MadChatter.Views.Message extends Backbone.View

  template: JST['mad_chatter/message']

  render: ->
    @$el.html @template(message: @model.toJSON())
    this