const Asteroid = require("./asteroid.js")

function Game(){
    const DIM_X = 600;
    const DIM_Y = 600;
    const NUM_ASTEROIDS = 6;
    this.asteroids = []
    this.addAsteroids()

}


Game.prototype.addAsteroids = function(){
    for(let i = 0; i < NUM_ASTEROIDS; i++) {
        randPos = Game.randomPosition();
        let asteroid = new Asteroid(randPos);
        this.asteroids.push(asteroid);
    }
}

Game.prototype.randomPosition = function(){
    let randX = Math.random() * 600;
    let randY = Math.random() * 600;
    return [randX, randY];
}

Game.prototype.draw = function(ctx){
    
}
