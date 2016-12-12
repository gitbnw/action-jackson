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
          @updateSquares data
  
        updateSquares: (data) ->
          
          $squares = $("#squares")
          # square = $("#square-"+ data["square"]["id"])
          squares = data["squares"]
          gameData = data["game"]
          arrayLength = squares.length
          i = 0
          while i < arrayLength
            html = @renderSquare data["squares"][i], gameData
            $square = $("#square-"+ data["squares"][i]["id"])
            $square.html html
            i++          

        renderSquare: (squareData, gameData) ->
          console.log squareData
          if gameData.turn == squareData.user
            "<div class='row' id='square-'" + squareData["id"] + "> position: "+ squareData["position"] + " status: "+ squareData["status"] + "<button class='take_square'>Take</button></div>"
          else
             "<div class='row' id='square-'" + squareData["id"] + "> position: "+ squareData["position"] + " status: "+ squareData["status"] + "</div>"         

        take_square: (square, game_id, user_id) ->
          @perform 'take_square', square: square, game_id: game_id, user_id: user_id    
  
      $('.take_square').click (e) ->
          console.log('click')
          $this = $(this)
          App.global_chat.take_square $this.val(), squares.data('game-id'), squares.data('user-id')
          e.preventDefault()
          return false