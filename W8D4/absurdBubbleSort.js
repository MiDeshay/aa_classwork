const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback){
    reader.question(`Is ${el1} > ${el2}?: `,  response => {
        if (response === "yes"){
            callback(true);
        }else{
            callback(false);
        }
    })
}

// askIfGreaterThan(3, 5, variable  => {
//     console.log(variable);
//     reader.close();
// })


function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
    if (i === arr.length - 1){
            outerBubbleSortLoop(madeAnySwaps);
    }

        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan){
            if (isGreaterThan){
                const temporary = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = temporary;
            }

        }
        )
}


fjaslfdjsldfjsdl