Array.prototype.mergeSort = function(){
    if (this.length < 2) return this;

    let mid = Math.floor(this.length / 2);

    let left = this.slice(0, mid);
    let right = this.slice(mid);

    left = left.mergeSort();
    right = right.mergeSort();

    return merge(left, right);
}

function merge(left, right){
    let merged = [];

    while(left.length != 0 && right.length != 0){
        if(left[0] > right[0]){
            merged.push(right.shift())
        }else{
            merged.push(left.shift())
        }
    }

    return merged.concat(left, right);
}

let arr = [2,3,1,5,8,2]

// console.log(arr.mergeSort())

Array.prototype.bSearch = function(target){
    if (this.length === 0) return -1;

    let mid = Math.floor(this.length/2);

    if (this[mid] === target) return mid;

    if (this[mid] > target){
        return this.slice(0, mid).bSearch(target);
    }else{
        let result = this.slice(mid+1).bSearch(target);
        if (result === -1) {
            return -1
        }else{
            return result + mid;
        }
    }
}
arr2 = [1,2,3,4,4,5,6,7,8,9]
console.log(arr2.bSearch(4));

