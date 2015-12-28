App.talk = App.cable.subscriptions.create "TalkChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if data['message']
      append_message(JSON.parse(data['message']))
    else if data['marker']
      append_marker(JSON.parse(data['marker']))

  speak: (message) ->
    @perform 'speak', message: message

  plot: (lat, lng) ->
    @perform 'plot', lat: lat, lng: lng

  delete: (id) ->
    @perform 'delete', id: id

$(document).on 'keypress', '[data-behavior~=speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.talk.speak(event.target.value)
    event.target.value = ''
    event.preventDefault()

$(document).on 'click', '[data-behavior~=plot]', (event) ->
  App.talk.plot(map.getCenter().lat(), map.getCenter().lng())
  event.preventDefault()
