import React from "react";
import * as Minesweeper from "./minesweeper"
import Board from "./board";

class Game extends React.Component{

  constructor(props){
    super(props)
   this.state = {board: new Minesweeper.Board(10, 5)};
   //this.state = {test: "1"}
   this.updateGame.bind(this);
  }

  updateGame(){
    
  }
  
  render () {
    const CurrentBoard = this.state.board;
    return (
      // <div>{this.state.board.grid.map(row, i => <div>{row}</div>)}</div>
   <Board board={CurrentBoard} update={this.updateGame}/>
    );
  }
}

export default Game;