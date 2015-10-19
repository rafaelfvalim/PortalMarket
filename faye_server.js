var http = require('http')
    , faye = require('faye');

var Logger = {
    incoming: function (message, callback) {
        console.log(message);
        console.log('====================');

        callback(message);
    }
};
var server = http.createServer(),
    bayeux = new faye.NodeAdapter({mount: '/faye', timeout: 45});
bayeux.attach(server);
server.listen(9292);
//var bayeux = new faye.NodeAdapter({mount: '/faye', timeout: 60});
//bayeux.addExtension(Logger);
//bayeux.listen(9292);
//