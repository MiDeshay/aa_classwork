import React from "react";

export default class TodoListItem extends React.Component{
    constructor(props){
        super(props)
        this.todo = props.todo;
        this.state = props.todo
        this.handleDone = this.handleDone.bind(this);
        this.handleDelete = this.handleDelete.bind(this);
    }

    handleDelete(){
        this.props.removeTodo(this.props.todo)
    }

    handleDone(){

        this.setState({done: !this.state.done})
        console.log(this.state.done)
        this.props.receiveTodo(this.state);
    }

    render(){
        let done = "Done"
        if(this.state.done){
            done = "Undo"
        }
        return (
            <li>
                Title: {this.todo.title}
                <br/>
                Body: {this.todo.body}
                <br/>
                <button onClick={this.handleDone}>{done}</button>
                <button onClick={this.handleDelete}>Delete Task</button>
            </li>
        )
    }
   
}