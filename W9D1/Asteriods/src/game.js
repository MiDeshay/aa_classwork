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
        debugger
        let asteroid = new Asteroid(randPos, this);
        this.asteroids.push(asteroid);
    }
}


Game.prototype.draw = function(ctx){
    let canvasEl = document.getElementById('game-canvas');
    ctx.clearRect(0, 0, canvasEl.width, canvasEl.height);

    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].draw(ctx);
    }
}

Game.prototype.moveObjects = function() {
    for(let i = 0; i < this.asteroids.length; i++) {
        this.asteroids[i].move();
    }
}

Game.prototype.wrap = function(position) {
    position[0] = position[0] % this.DIM_X;
    position[1] = position[1] % this.DIM_Y;
}

module.exports = Game;
