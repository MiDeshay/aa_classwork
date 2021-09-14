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
    this.renderWinState = this.renderWinState.bind(this);
    this.resetGame = this.resetGame.bind(this);
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

  resetGame() {
      this.setState({ board: new Minesweeper.Board(10, 5)});
      return ;
  }

  renderWinState(){
    if (this.state.board.won()){
      return (<div className="winState">
        <div>You Are The MineSweep!
        <button onClick={this.resetGame}>Reset</button></div>
      </div>)
    }else if (this.state.board.lost()){
      return (<div className="loseState">
          <div>You Blew It Up!
          <button onClick={this.resetGame}>Reset</button></div>
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