doctype 5
html ->
  head ->
    title @title
    link rel: 'stylesheet', href: '/css/app.css'
    script type: 'text/javascript', src: '/js/app.js'
    script type: 'text/javascript', src: '/nowjs/now.js'
    script type: 'text/javascript', src: 'http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js'
    script type: 'text/javascript', src: 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js'

  body ->
    audio id: 'ding', src: '/wavs/sfx/ding.wav', type: 'audio/wav'
    audio id: 'snare', src: '/wavs/drums/snare.wav', type: 'audio/wav'
    div id: 'wrap', ->
      div id: 'header', ->
        a href: '/', ->
          h1 ->
            @title

      div id: 'content', ->
        @body
      div id: 'footer', ->
        span -> img src: '/images/coffeescript.png'
        p ->
          em 'Node-Chess generated with Cupcake, written in coffee-script!'

