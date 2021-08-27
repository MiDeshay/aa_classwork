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



function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop){
    if (i === arr.length - 1){
        outerBubbleSortLoop(madeAnySwaps);
    } else {
        askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan){
        if (isGreaterThan){
            madeAnySwaps = true;
            const temporary = arr[i];
            arr[i] = arr[i + 1];
            arr[i + 1] = temporary;
        }
    })
        innerBubbleSortLoop(arr, i + 1, madeAnySwaps, outerBubbleSortLoop );
    }

  


}
// function absurdBubbleSort(arr, sortCompletionCallback){
//     function outerBubbleSortLoop(madeAnySwaps){
        
//     }
// }
let arr = [2,5,6,7,9,4,3,7,1]

innerBubbleSortLoop(arr, 0, false, function (){
    console.log("In outer bubble sort");
    reader.close();
});

