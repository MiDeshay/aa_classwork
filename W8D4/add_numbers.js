const readline = require('readline');
const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback){
    if(numsLeft > 0){
        reader.question("Pick a number: ", function(number) {
            const num = parseInt(number);
            sum += num;
            console.log(sum);
            numsLeft -= 1;
        })
    }
}
