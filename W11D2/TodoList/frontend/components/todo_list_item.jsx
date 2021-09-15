import React from "react";

export const TodoListItem = (props) => {

    return (
        <li>
            Title: {props.todo.title}
            <br/>
            Body: {props.todo.body}
            <br/>
            Done: {props.todo.done.toString()}
        </li>
    )
}