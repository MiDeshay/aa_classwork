import React from "react";

class Tabs extends React.Component{
    constructor(props){
        super(props)
        this.state ={
            index: 0
        }

        this.updateTab.bind(this)
    }
    updateTab(indexNum){
        // console.log(`you clicked tab: ${indexNum}`)
        this.setState({index: indexNum})
    }

    getContent(indexNum) {
        return this.state.index === indexNum ? this.props.array[indexNum].content : null;
    }

    render(){
        return(
            <ul className="tabs">
                <div className="tabs">
                    {this.props.array.map((object, i) => 
                    <li key={i} onClick={()=>{this.updateTab(i)}}>
                        <h1>{object.title}</h1>
                        
                    </li>
                    )}
                </div>
                <article className="tabs">{
                    // this.props.array[this.state.index].content
                    this.getContent(this.state.index)
                }</article>
            </ul>
        )
    }
}

export default Tabs;