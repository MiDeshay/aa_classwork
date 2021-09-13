import React from "react";
import Tile from "./tile";

class Board extends React.Component{
    constructor(props){
        super(props)

    }

    render(){
        return(
          <div>
              {this.props.board.grid.map(row, i => 
              <div>
                  {row.map(tile, j => <Tile x={i} y={j}/>)}
              </div>)}
          </div>
        )
    }
}

export default Board;