import React from "react";

class Tile extends React.Component{
    constructor(props) {
        super(props);
        this.state = {
            bombed: props.board.grid[props.x][props.y].bombed,
            explored: props.board.grid[props.x][props.y].explored,
            flagged: props.board.grid[props.x][props.y].flagged,
            lost: props.lost
        }
    }

    

    render(){

        var renderState = "⬛";
        var tileClassName = "unexplored";
        if (this.state.explored) {
            renderState = this.props.board.grid[props.x][props.y].adjacentBombCount();
            tileClassName = "explored";
        } else if (this.state.flagged) {
            renderState = "🚩";
        } else if (this.state.bombed && this.state.lost) {
            renderState = "💣";
        }

        return(
            <div className="tile" className={tileClassName} >
            {renderState}
            </div>
        )
    }
}

export default Tile;