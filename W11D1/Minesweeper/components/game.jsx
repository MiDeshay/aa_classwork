import React from "react";
import * as Minesweeper from "./minesweeper";
import Board from "./board";

class Game extends React.Component{

  constructor(props){
    super(props);
    const board = new Minesweeper.Board(10, 5);
    this.state = {board: board};
    //this.state = {test: "1"}
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame(tile, flagged){
    console.log(tile);
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    if (this.state.board.lost()){
      console.log("Lost")
    }else if (this.state.board.won()){
      console.log("Won")
    }


    this.setState({ board: this.state.board });
  }

  renderWinState(){
    if (this.state.board.win()){
      return (<div className="winState">
          You Are The MineSweep!
      </div>)
    }else if (this.state.board.lost()){
      return (<div className="loseState">
          You Blew It Up!
        </div>)
    }else{
      return null;
    }

  }
  
  render () {
    const CurrentBoard = this.state.board;
    return (
      <div>
        <Board board={CurrentBoard} update={this.updateGame}/>

          { this.renderWinState() }
        
      </div>
   
    );
  }
}

export default Game;