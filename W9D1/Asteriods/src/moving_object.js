function MovingObject(optionsHash) {
    this.position = optionsHash["position"];
    this.velocity = optionsHash["velocity"];
    this.radius = optionsHash["radius"];
    this.color = optionsHash["color"];
}


MovingObject.prototype.draw = function (ctx){
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
        this.position[0],
        this.position[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    ctx.fill();
}

MovingObject.prototype.move = function(){
    this.position[0] += this.velocity[0];
    this.position[1] += this.velocity[1];

}

module.exports = MovingObject;