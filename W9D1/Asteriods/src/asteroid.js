const Util = require("./util.js");
const Game = require("./game.js")
const MovingObject = require("./moving_object.js");

function Asteroid(position, game) {
    
    // this.position = position;
    // this.velocity = Util.randomVec(3);
    // this.radius = 25;
    // this.color = "#DCDCDC";
    asteroid = {
        position: position,
        velocity: Util.randomVec(3),
        radius: 25, 
        color: "#DCDCDC",
        game: game
     }
   

   MovingObject.call(this, asteroid)
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;