// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  var Piece = require("./piece");
}
// DON'T TOUCH THIS CODE

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let arr = [];
  for(let i = 0; i < 8; i++){
    let sub = [];
    for(let j = 0; j < 8; j++){
      if((i === 3 && j === 4) || (i === 4 && j === 3)){
        sub.push(new Piece("black"));
      }else if((i === 3 && j === 3) || (i === 4 && j === 4)){
        sub.push(new Piece("white"));
      }else{
        sub.push(undefined);
      }
    }
    arr.push(sub);
  }
  return arr;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let row = pos[0];
  let col = pos[1];
  if(row < 0 || row > 7 || col < 0 || col > 7){
    return false;
  }else {
    return true;
  }
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if(this.isValidPos(pos)){
    return this.grid[pos[0]][pos[1]];
  }else{
    throw new Error('Not valid pos!');
    return false;
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  if(this.getPiece(pos) != undefined &&  this.getPiece(pos).color === color ){
    return true;
  }else{
    return false;
  }
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if(this.getPiece(pos)){
    return true;
  }else{
    return false;
  }
};

Board.prototype.capturedPiece = function (arr, color){
  arr.forEach(piece => {
    if(color === "white"){
      if(piece.color === "black"){
        return true;
      }
    }else{
      if(piece.color === "white"){
        return true ;
      }
    }
  })
  return false; 
}

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip = []){
  

  let newRow = pos[0] + dir[0];
  let newCol = pos[1] + dir[1];

  newPos = [newRow, newCol];

  if(!this.isValidPos(newPos) || !this.isOccupied(newPos)){ 
    return [];
  } else if(this.isMine(newPos, color)){
    return piecesToFlip;
  } 
  
  piecesToFlip.push(newPos);
  

  return this._positionsToFlip(newPos, color, dir, piecesToFlip);

};


/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)){
    return false;
  }
  for(let i = 0; i < Board.DIRS.length; i++){
    let temp = this._positionsToFlip(pos, color, Board.DIRS[i]);
    if(temp.length > 0){
      return true;
    }
  }
  return false; 
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)){
    return new Error("Invalid move!")
  }else{
    let row = pos[0];
    let col = pos[1];

    this.grid[row][col] = new Piece(color)

    //get spaces to flip
    
    for(let i = 0; i < Board.DIRS.length; i++){
      let temp = this._positionsToFlip(pos, color, Board.DIRS[i]);
     
      }

    //flip the spaces
  }


  
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};


// DON'T TOUCH THIS CODE
if (typeof window === 'undefined'){
  module.exports = Board;
}
// DON'T TOUCH THIS CODE