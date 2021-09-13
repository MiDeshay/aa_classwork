import React from "react";
import Tile from "./tile";

class Board extends React.Component{
    constructor(props){
        super(props)

    }

    render(){
        // console.log(this.props.board.grid);
        return(
          <div>
              {this.props.board.grid.map((row, i) => 
              <div>
                  {row.map((tile, j) => 
                  <Tile x={i} y={j} board={this.props.board} key={(i * this.props.board.gridSize + j)}/>
                  )}
              </div>)}
          </div>
        )
    }
}

export default Board;