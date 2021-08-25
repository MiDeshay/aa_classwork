Array.prototype.bubbleSort = function() {
  let sorted = false 
  while (!sorted) {
    sorted = true;
    for (let i = 0; i< this.length; i++) {
      for (let j = 0; j< this.length; j++) {
        if( this[i] > this[j] && i < j ) {
          sorted = false;
          let x = this[j]
          this[j] = this[i]
          this[i] = x
        };
      };
    }; 
  };
  return this;
};

array = [3,4,2,7,4,1]

// console.log(array.bubbleSort())


String.prototype.substrings = function() {
  let arr = []; 
  for(let i = 0; i < this.length; i++){
    for(let j = i; j < this.length; j++){
      arr.push(this.slice(i, j+1));
    }
  }

  return arr;
}

console.log("This".substrings())