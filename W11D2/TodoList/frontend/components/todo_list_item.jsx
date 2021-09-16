import React from "react";

export default class TodoListItem extends React.Component{
    constructor(props){
        super(props)
        this.todo = props.todo;
        this.handleDone = this.handleDone.bind(this);
        this.handleDelete = this.handleDelete.bind(this);
    }

    handleDelete(){
        this.props.removeTodo(this.props.todo)
    }

    handleDone(){
        const newTodo = Object.assign({}, this.todo);
        console.log(newTodo.done)
        newTodo.done = !newTodo.done
        console.log(newTodo.done) 
        this.props.receiveTodo(newTodo);
    }

    render(){
        let done = "Done"
        if(this.todo.done){
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