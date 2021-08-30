const Util = require("./util.js");
const MovingObject = require("./moving_object.js");




function Asteroid(position) {
    
    this.position = position;
    this.velocity = Util.randomVec(3);
    this.radius = 25; 

}

Util.inherits(Asteroid, MovingObject);



Asteroid.prototype.constructor = function(pos) {
    //super(pos, Util.randomVec(3) , 25, "#DCDCDC")
   
}

modele.exports = Asteroid;