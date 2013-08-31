class MadChatter.Views.Message extends Backbone.View

  render: ->
    @$el.html "<p class=\"message\"><time>#{moment(@model.get('created_at'),"YYYY-MM-DD'T'HH:mm:ss.SSSZ").format('MMM D, h:mm A')}</time><strong>#{@model.get('author_username')}</strong>: #{@model.get('html')}</p>"
    this