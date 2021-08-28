Function.prototype.inherits = function (SuperClass){
    function Surrogate(){};
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this; 
}

function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

let michael = new Asteroid();

//console.log(Asteroid.__proto__ === Ship.__proto__);


console.log(Asteroid.prototype)

//console.log(michael.__proto__)

//console.log(MovingObject.prototype)

//console.log(Asteroid.__proto__.__proto__ === MovingObject.prototype);

