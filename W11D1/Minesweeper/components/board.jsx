import React from "react";
import Tile from "./tile";

class Board extends React.Component{
    constructor(props){
        super(props)

        this.renderRows.bind(this)
        this.renderTiles.bind(this)
    }

    renderRows(){
        const that = this;
        return this.props.board.grid.map((row, i) => <div className ="row">
            {that.renderTiles(row, i)}
        </div>)
    }

    renderTiles(row, i){
        const that = this;
        return row.map((tile, j) => 
            <Tile x={i} y={j} board={that.props.board} key={(i * that.props.board.gridSize + j)}/>
            )
       
    }

    render(){
        console.log(this);
        return(
          <div className="board">
            {this.renderRows()}
          </div>
        )
    }
}

export default Board;