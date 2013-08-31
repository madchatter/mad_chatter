class MadChatter.Views.Room extends Backbone.View

  el: '#room'

  events:
    'click #previous_messages': 'fetchPrevious'
    'submit #new_message': 'newMessage'

  initialize: ->
    @listenTo @model.messages, 'add', @addMessage

  render: ->
    this

  addMessage: (message)->
    view = new MadChatter.Views.Message(model: message)
    @$el.find('.messages').append view.render().el

  newMessage: (event)=>
    event.preventDefault()
    $text_field = $(event.target).find('input[type=text]')
    message = new MadChatter.Models.Message({text: $text_field.val()}, collection: @model.messages)
    message.save {}, 
      error: (message, xhr, options)-> alert 'Sorry, an error occurred while trying to send your message.'
      success: (message, response, options) =>
        @addMessage message
        $text_field.val('')

  fetchPrevious: (event)->
    event.preventDefault()
    @model.messages.fetchPrevious()