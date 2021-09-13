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
        if (this.state.explored) {
            renderState = "⬜";
        } else if (this.state.flagged) {
            renderState = "🚩";
        } else if (this.state.bombed && this.state.lost) {
            renderState = "💣";
        }

        return(
            <>
            {renderState}
            </>
        )
    }
}

export default Tile;