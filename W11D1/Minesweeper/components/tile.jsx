import React from "react";

class Tile extends React.Component{
    constructor(props) {
        super(props);
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick() {
        this.props.update(this.props.tile, true);
    }

    render(){
        let renderState = "⬛";
        let tileClassName = "unexplored";
        if (this.props.tile.explored) {
            renderState = this.props.tile.adjacentBombCount();
            tileClassName = "explored";
        } else if (this.props.tile.flagged) {
            renderState = "🚩";
        } else if (this.props.tile.bombed && this.props.tile.lost) {
            renderState = "💣";
        }

        return(
            <div onClick={this.handleClick} className="tile" className={tileClassName}>
                {renderState}
            </div>
        )
    }
}

export default Tile;