
/**
 * Module dependencies.
 */

var express = require('express');
var rooms = [];
var app = module.exports = express.createServer();
var io = require('socket.io').listen(9002);

io.sockets.on('connection', function (socket) {
  socket.emit('news', { hello: 'world' });
  socket.on('my other event', function (data) {
    console.log(data);
  });
});

function Room() {
  this.occupants = [];
  this.game = null;
}

function CreateRoom(userid)
{
  newRoom = new Room();
  rooms[rooms.length] = newRoom;
}


// Configuration

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(express.cookieParser());
  app.use(express.session({ secret: 'your secret here' }));
  app.use(express.compiler({ src: __dirname + '/public', enable: ['sass'] }));
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); 
});

app.configure('production', function(){
  app.use(express.errorHandler()); 
});

// Routes

app.get('/', function(req, res){
  if (req.session.username != undefined)
  {
    res.render('index', {
      title: 'Express',
      logmsg: 'You logged in, '+req.session.username+'! :)'
    });
  }
  else
  { 
    res.render('index', {
      title: 'Express',
      logmsg: 'No login :('
    });
  }
});
app.get('/login', function(req, res){
  res.render('login', {
    title: 'Login Page'
  });
});

app.get('/socket', function(req, res){
  res.render('socket', {
    title: 'BOOBES'
  });
});

app.post('/login', function(req, res){
  req.session.username=req.param('username');
  res.redirect('/');
});
  

app.listen(9001);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
