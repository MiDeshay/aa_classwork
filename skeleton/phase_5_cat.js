function Cat(name, owner){
    this.name = name;
    this.owner = owner;
}

Cat.prototype.cuteStatement = function(){
    return `${this.owner} loves ${this.name}`
}

cat1 = new Cat("Princess", "mike");

// console.log(cat1.cuteStatement())

Cat.prototype.cuteStatement = function(){
    return `Everyone loves ${this.name}`
}

// console.log(cat1.cuteStatement())

Cat.prototype.meow = function(){
    return `meow`
}

cat1.meow = function() {
    return "MEOW"
}