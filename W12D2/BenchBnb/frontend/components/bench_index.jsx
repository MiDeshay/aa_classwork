import React from "react";
import BenchIndexItem from "./bench_index_item";

class BenchIndex extends React.Component{

    constructor(props){
        super(props);
    }

    componentDidMount(){
        this.props.fetchBenches()

    }

    render(){
        return (
            <div>
                <ul>
                    {this.props.benches.map((bench, i) => 
                    <BenchIndexItem bench={bench} key={i}/>
                    )}
                </ul>
                
            </div>
        )
    }
}

export default BenchIndex