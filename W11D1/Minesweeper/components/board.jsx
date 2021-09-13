import React from "react";
import Tile from "./tile";

class Board extends React.Component{
    constructor(props){
        super(props);

        this.renderRows = this.renderRows.bind(this);
        this.renderTiles = this.renderTiles.bind(this);
    }

    renderRows(){
        return this.props.board.grid.map((row, i) => <div className ="row">
            {this.renderTiles(row, i)}
        </div>)
    }

    renderTiles(row, i){
        return row.map((tile, j) => 
            <Tile board={this.props.board} key={(i * this.props.board.gridSize + j)} update={this.props.update} tile={tile}/>
            )
       
    }

    render(){
        // console.log(this);
        return(
          <div className="board">
            {this.renderRows()}
          </div>
        )
    }
}

export default Board;