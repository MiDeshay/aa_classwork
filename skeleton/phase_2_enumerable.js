Array.prototype.myEach = function(cb) {
  this.forEach(cb);
  return this
};

function doubler(num) { 
  return num * 2;
};

array1 = [1,2,3]

// console.log(array1.myEach(doubler))

Array.prototype.myMap = function(cb) {
  let arr = [];
  //arr.push(this.forEach(el => cb(el)))

  for(let i = 0; i < this.length; i++){
    arr[i] = cb(this[i]);
  }
  return arr
};

// console.log(array1.myMap(doubler))

Array.prototype.myInject = function(cb, acc = 0){
  this.forEach((el) => {
    acc = cb(el, acc);
  });
  return acc;
}

// console.log([1, 2, 3].myInject(function(acc, el) { // 1 + 1 + 1; 3 + 2 + 2; 9 + 3 + 3 
//   return acc + el;
// }))

// console.log([1, 2, 3].myInject(function(acc, el) {
//   return acc + el;
// }, 25))


