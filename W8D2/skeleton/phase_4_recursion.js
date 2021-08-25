function range(start, end){
  if (start === end) return [start];
  return [start].concat(range(start+1, end));
}
// console.log(range(1,5))

function sumRec(arr) {
  if (arr.length <= 1) {
    return arr[0];
  }
  return arr.shift() + sumRec(arr);
}

array = [1,2,3,4,5];

// console.log(sumRec(array))

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp - 1)

}

function exponent2 (base, exp) {
    if (exp === 0) {
      return 1;
    }
    if (exp % 2 === 0){
    return exponent2(base, exp / 2) ** 2; 
    }else{
    return base * (exponent2(base, (exp - 1) / 2) ** 2);
    }

  
  }

// console.log(exponent2(2, 3))

function fibonacci(n) {
  if (n === 0) {
    return []
  }

  if (n === 1) {
    return [0]
  }

  if (n === 2) {
    return [0,1]
  }

  let fibArray = [fibonacci(n-1)]
  return fibArray.push([fibonacci(n-1)][fibonacci(n-1).length - 1] + [fibonacci(n-2)][fibonacci(n-2).length - 2])

}

console.log(fibonacci(6))