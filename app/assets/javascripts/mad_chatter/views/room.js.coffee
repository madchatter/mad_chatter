class MadChatter.Views.Room extends Backbone.View

  el: '#room'

  events:
    'click #previous_messages': 'fetchPrevious'
    'submit #new_message': 'newMessage'

  initialize: ->

  render: ->

  addMessage: (message)->
    view = new MadChatter.Views.Message(model: message)
    @$el.find('.messages').append view.render().el

  newMessage: (event)->
    event.preventDefault()
    $el = $(event.target)
    $.post $el.attr('action'), $el.serialize(), ->
      $el.find('input[type=text]').val('')

  fetchPrevious: ->
    @collection.fetchPrevious (messages)->
      # display messages