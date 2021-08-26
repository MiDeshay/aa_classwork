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
            reader.close();
        })
        } else if (numsLeft === 0){
            completionCallback(sum);
        }else{
            console.log("Yes");
        addNumbers(sum, numsLeft-1, completionCallback)
    }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
