coffeekup = require 'coffeekup'
nano = require 'nano'
express = require 'express'
app = express.createServer()
now = require 'now'

app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

# Setup Static Files
app.use express.static(__dirname + '/public')

# Setup Assets
app.use require('connect-assets')()

# App Routes
app.get '/', (req, resp) ->
  resp.render 'index', title: 'Cupcake Generated Chess Demo'

# Listen
app.listen 3000, -> console.log 'Listening on port 3000'

everyone = now.initialize(app)
everyone.now.distributeMessage = (message) ->
  everyone.now.receiveMessage(this.now.name, message)

everyone.connected(  () ->
  everyone.now.receiveMessage("name", "message")
)

everyone.now.updateElement = (className, top, left) ->
  everyone.now.receiveElement(className, top, left)
everyone.now.distributeSound = (audiotag) ->
  everyone.now.receiveSound(audiotag)
