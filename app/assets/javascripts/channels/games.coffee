# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'turbolinks:load', ->
    squares = $('#squares')
    App.global_chat = App.cable.subscriptions.create {
        channel: "GameChannel"
        game_id: squares.data('game-id')
        user_id: squares.data('user-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server
    
      disconnected: ->
        # Called when the subscription has been terminated by the server
    
      received: (data) ->
        # jquery to update page - turn - hide buttons
        players.html()
        squares.html()
        squares.append data['message']
        messages_to_bottom()
    
      take_square: (square, game_id, user_id) ->
        @perform 'take_square', square: square, game_id: game_id, user_id: user_id    

    $('.take_square').click (e) ->
        console.log('click')
        $this = $(this)
        App.global_chat.take_square $this.val(), squares.data('game-id'), squares.data('user-id')
        e.preventDefault()
        return false