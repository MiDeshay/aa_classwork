import React from "react";

class Tile extends React.Component{
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) {
        this.props.update(this.props.tile, e.altKey);
    }

    render(){
        let renderState = "⬛";
        let tileClassName = "tile unexplored";
        if (this.props.tile.explored) {
            tileClassName = "tile explored";

            if (this.props.tile.bombed ) {
            renderState = "💣";
            }else{
                renderState = this.props.tile.adjacentBombCount();
            }
        } else if (this.props.tile.flagged) {
            renderState = "🚩";
        }  

        return(
            <div onClick={(e) => {this.handleClick(e)}} className={tileClassName}>
                {renderState}
            </div>
        )
    }
}

export default Tile;