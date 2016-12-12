# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery(document).on 'turbolinks:load', ->
    squares = $('#squares')
    if $('#squares').length > 0 
      App.global_chat = App.cable.subscriptions.create {
          channel: "GameChannel",
          game_id: squares.data('game-id')
        },
        connected: ->
          # Called when the subscription is ready for use on the server
          console.log 'subscription connected'
      
        disconnected: ->
          # Called when the subscription has been terminated by the server
      
        received: (data) ->
          # jquery to update page - turn - hide buttons
          # players.html()
          @updateSquare data
  
        updateSquare: (data) ->
          console.log data
          html = @renderSquare data
          square = $("#square-"+ data["square"]["id"])
          console.log square
          square.html html
     
        renderSquare: (data) ->
          "<div class='row' id='square-'" + data["square"]["id"] + "> position: "+ data["square"]["position"] + " status: "+ data["square"]["status"] + "</div>"
      
        take_square: (square, game_id, user_id) ->
          @perform 'take_square', square: square, game_id: game_id, user_id: user_id    
  
      $('.take_square').click (e) ->
          console.log('click')
          $this = $(this)
          App.global_chat.take_square $this.val(), squares.data('game-id'), squares.data('user-id')
          e.preventDefault()
          return false