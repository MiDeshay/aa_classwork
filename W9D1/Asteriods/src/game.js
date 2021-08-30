const Asteroid = require("./asteroid.js")

function Game(){
    this.DIM_X = 600;
    this.DIM_Y = 600;
    this.NUM_ASTEROIDS = 6;
    this.asteroids = []
    this.addAsteroids()
}

Game.prototype.randomPosition = function(){
    let randX = Math.random() * 600;
    let randY = Math.random() * 600;
    return [randX, randY];
}

Game.prototype.addAsteroids = function(){
    for(let i = 0; i < this.NUM_ASTEROIDS; i++) {
        randPos = this.randomPosition();
        let asteroid = new Asteroid(randPos);
        this.asteroids.push(asteroid);
    }
}


Game.prototype.draw = function(ctx){
    // let canvasEl = document.getElementById('game-canvas');
    // let canvasContext = canvasEl.getContext("2d");
    ctx.clearRect(0, 0, ctx.width, ctx.height);

    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx);
    }
}

Game.prototype.move = function() {
    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
}

module.exports = Game;
