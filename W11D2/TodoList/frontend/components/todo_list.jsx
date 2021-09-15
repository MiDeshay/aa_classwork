import React from "react"
import { TodoListItem } from "./todo_list_item"

export default ({todos}) => (
    
    <div>
        {console.log(todos)}
        <h1>Todo List</h1>
        <ul>
            {todos.map( (todo, i) => 
                <TodoListItem todo={todo} key={i}/>
            )}
        </ul> 
    </div>
)