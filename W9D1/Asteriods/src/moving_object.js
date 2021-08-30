function MovingObject(positon, velocity, radius, color) {
    this.positon = positon;
    this.velocity = velocity;
    this.radius = radius;
    this.color = color;
}


MovingObject.prototype.draw = function (ctx){
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
        this.positon[0],
        this.positon[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fill();
}

MovingObject.prototype.move = function(){
    this.positon[0] += this.velocity[0];
    this.positon[1] += this.velocity[1];

}

module.exports = MovingObject;