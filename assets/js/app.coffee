jQuery(document).ready ->
  now.ready ->
    $("#messages").show()
    now.distributeMessage('has connected')

  setPosition = (className, top, left) ->
    $("#messages").show()
    now.updateElement(className, top, left)

    now.name = prompt("What's your name?", "")

  className = ""
  $( ".chess_piece" ).draggable(
    opacity: 0.55
    delay: 200
    distance: 10
    snap: true
    snapMode: 'inner'
    snapTolerance: 30
    start: (event, ui) ->
      className = ui.helper.context.className.toString()
    stop: (event, ui) ->
      piecePath= ui.helper.context.src.match(/chess_pieces*.*/)
      pieceName = piecePath.toString().replace("chess_pieces/", "")
      setPosition(className, ui.position.top, ui.position.left)
      now.distributeMessage("has moved the #{pieceName.replace('_', ' ').replace('.png', '')}")
    )

  $("#text_input").keyup (event) ->
    if event.keyCode == 13
      now.distributeMessage($("#text_input").val())
      $("#text_input").val("")

  $("#send_button").click( () ->
    now.distributeMessage($("#text_input").val())
    $("#text_input").val("")
  )
  now.receiveMessage = (name, message) ->
    $("#messages").prepend("<p>" + name + ": " + message + "</p>")
  now.receiveElement= (className, top, left) ->
    $(".#{className.replace(" ",  ".").replace(" ui-draggable", "")}").css({"position":"relative","left":"#{left}px","top":"#{top}px"})

