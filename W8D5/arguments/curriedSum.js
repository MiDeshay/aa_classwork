function curriedSum(numArgs) {
  const numbers = [];
  return function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      for (let i = 0; i < numbers.length; i++) {
        sum += numbers[i];
      }
      return sum;
    } else {
      return _curriedSum;
    }
  };
}

// Function.prototype.curry = function (numArgs) {
//   const args = [];
//   let that = this
//   return function _curriedFunction(arg) {
//     args.push(arg);
//     if (args.length === numArgs) {
//       return that(...args);
//     } else {
//       return _curriedFunction;
//     }
//   };
// }
// Function.prototype.curry = function (numArgs) {
//   let that = this;
//   return function _curriedFunction(...args) {
//     if (args.length === numArgs) {
//       return that(...args);
//     } else {
//       return _curriedFunction;
//     }
//   };
// }

Function.prototype.curry = function (numArgs) {
  const args = [];
  let that = this
  return function _curriedFunction(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(that, args);
    } else {
      return _curriedFunction;
    }
  };
}

// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

function multiply(...args) {

  let total = 1;
  // console.log(args)
  for (let i = 0; i < args.length; i++) {
    total *= args[i];

  }
  // console.log(total);
  return total;
}

// console.log(multiply(5, 3, 2))

console.log(multiply.curry(3)(5)(3)(2));