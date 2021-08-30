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

module.exports = MovingObject;