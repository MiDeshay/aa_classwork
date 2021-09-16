import React from "react"
import TodoListItem from "./todo_list_item"
import TodoForm from "./todo_form"

export default (props) => (
    
    <div>
        <h1>Todo List</h1>
        <ul>
            {props.todos.map( (todo, i) => 
                <TodoListItem todo={todo} key={i} removeTodo={props.removeTodo} receiveTodo={props.receiveTodo}/>
            )}
        </ul> 

        <TodoForm receiveTodo={props.receiveTodo}/>
    </div>
)