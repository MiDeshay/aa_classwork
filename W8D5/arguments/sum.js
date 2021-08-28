// function sum(){
//   let total = 0;
//   for (let i = 0; i < arguments.length; i++){
//     total += arguments[i];
//   }
//   return total;
// }

function sum(...args) {
  let total = 0;
  let array = Array.from(args);
  for (let i = 0; i < array.length; i++) {
    total += array[i];
  }
  return total;
}

console.log(sum(1, 2, 3, 4));
console.log(sum(1, 2, 3, 4, 5));