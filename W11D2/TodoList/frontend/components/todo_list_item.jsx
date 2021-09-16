import React from "react";

export default class TodoListItem extends React.Component{
    constructor(props){
        super(props)
        this.todo = props.todo;
    }

    handleDone(){
        
    }

    render(){
        const done = "Done"
        if(!this.todo.done){
            done = "Undo"
        }
        return (
            <li>
                Title: {this.todo.title}
                <br/>
                Body: {this.todo.body}
                <br/>
                <button onClick={this.handleDone}>{done}</button>
            </li>
        )
    }
   
}