class MadChatter.Views.Message extends Backbone.View

  initialize: ->

  render: ->
    @$el.html "<p><strong>#{@model.get('author_username')}</strong>: #{@model.get('html')}</p>"
    @