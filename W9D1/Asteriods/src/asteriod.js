const Util = require("./util.js");
const MovingObject = require("./moving_object.js");

function Asteroid(position) {
    Util.inherits(this, MovingObject);
    this.position = position
}

Asteroid.prototype.constructor = function() {
    super(this.position, , 25, "#DCDCDC")
}