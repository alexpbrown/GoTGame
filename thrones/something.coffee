mongoose = require('mongoose')
Schema = mongoose.Schema
mongooseAuth = require('mongoose-auth')

Territory = new Schema {
  name: String
  crowns: { type: Number, min: 0, max: 2 }
  mustering: { type: Number, min: 0, max: 2 }
  type: { type: String, enum: ['land', 'sea'] }
  home: Boolean
  adjacencies: [Territory]
}

Card = new Schema {
  title: String
  description: String
  wildlings: Boolean
  discarded: Boolean
}

Deck = new Schema {
  name: String
  cards: [Card]
}

UserSchema = new Schema {}, User
UserSchema.plugin mongooseAuth, {
  everymodule: {
    everyauth: {
      User: ->
        return User
    }
  }

  password: {
    everyauth: {
      getLoginPath: '/login'
      postLoginPath: '/login'
      loginView: 'login.coffee'
      getRegisterPath: '/register'
      postRegisterPath: '/register'
      registerView: 'register.coffee'
      loginSuccessRedirect: '/'
      registerSuccessRedirect: '/'
    }
  }
}

mongoose.model('Territory', Territory)
mongoose.model('Card', Card)
mongoose.model('Deck', Deck)
mongoose.model('User', UserSchema)
mongoose.connect('mongodb://localhost/thrones')

x=3
console.log(Territory)

mongooseAuth.middleware()

User = mongoose.model('User')

zappa = require('zappa')

#app = zappa.run 3012, {}, {mongooseAuth}, ->
#  use 'bodyParser', mongooseAuth.middleware(), static: __dirname + '/public', 'cookieParser', session: { secret: 'esoognom' }

#mongooseAuth.helpExpress(app.app)
