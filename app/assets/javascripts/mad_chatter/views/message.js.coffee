class MadChatter.Views.Message extends Backbone.View

  render: ->
    @$el.html "<p><strong>#{@model.get('author_username')}</strong>: #{@model.get('html')}</p>"
    this