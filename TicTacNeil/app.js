
/**
 * Module dependencies.
 */

var express = require('express');
var users = {};
var sockets = {};
var app = module.exports = express.createServer();
var io = require('socket.io');
var MemoryStore = express.session.MemoryStore
var sessionStore = new MemoryStore();

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
  app.use(express.session({ store: sessionStore, secret: 'your secret here', key: 'express.sid' }));
  app.use(express.compiler({ src: __dirname + '/public', enable: ['sass'] }));
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
  app.use(function (req, res) {
    res.end('<h2>Hello, your session id is ' + req.sessionID + '</h2>');
  });
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

var sio = io.listen(app);
var parseCookie = require('connect').utils.parseCookie;
var Session = require('connect').middleware.session.Session;

sio.set('authorization', function (data, accept) {
    if (data.headers.cookie) {
        data.cookie = parseCookie(data.headers.cookie);
        data.sessionID = data.cookie['express.sid'];
        // save the session store to the data object 
        // (as required by the Session constructor)
        data.sessionStore = sessionStore;
        sessionStore.get(data.sessionID, function (err, session) {
            if (err) {
                accept(err.message, false);
            } else {
                // create a session object, passing data as request and our
                // just acquired session data
                data.session = new Session(data, session);
                accept(null, true);
            }
        });
    } else {
       return accept('No cookie transmitted.', false);
    }
});

sio.sockets.on('connection', function (socket) {
    var hs = socket.handshake;
    console.log(hs.session.username + ' has connected!');
    // setup an inteval that will keep our session fresh
    var intervalID = setInterval(function () {
        // reload the session (just in case something changed,
        // we don't want to override anything, but the age)
        // reloading will also ensure we keep an up2date copy
        // of the session with our connection.
        hs.session.reload( function () { 
            // "touch" it (resetting maxAge and lastAccess)
            // and save it back again.
            hs.session.touch().save();
        });
    }, 60 * 1000);
    socket.on('disconnect', function () {
        console.log(hs.session.username + ' has disconnected!');
        // clear the socket interval to stop refreshing the session
        clearInterval(intervalID);
    });
 
});