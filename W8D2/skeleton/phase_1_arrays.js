Array.prototype.uniq = function() {
  let hash = {}
  this.forEach(element => {
    hash[element] = true;
  });
  return Object.keys(hash);
};

// console.log([1,2,3,4].uniq())
// console.log([1,2,3,4,4].uniq())


Array.prototype.twoSum = function() {
  let arr = []
  for (let idx = 0; idx < this.length; idx++){
    for (let idx2 = 0; idx2 < this.length; idx2++){
      if (idx < idx2){
        if (this[idx] + this[idx2] === 0){
          arr.push([idx,idx2])
        }
      }
    }
  }
  return arr
}

// console.log([1,-1,2,3,-2].twoSum())

Array.prototype.transpose = function() {
  let arr = [];
  for (let i = 0; i < this.length; i++){
    let sub = [];
    for (let j = 0; j < this.length; j++){
      sub.push(this[j][i]);
    };
    arr.push(sub);
  };
  return arr;
};

array1 = [[1,2,3],[4,5,6],[7,8,9]]

console.log(array1.transpose())