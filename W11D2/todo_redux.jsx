import React from "react";
import ReactDom from 'react-dom';
import configureStore from './frontend/store/store'
import {receiveTodos, receiveTodo} from "./frontend/actions/todo_actions"

document.addEventListener("DOMContentLoaded", ()=>{
    const store = configureStore();
    window.store = store; 
    window.receiveTodos = receiveTodos
    window.receiveTodo = receiveTodo
    ReactDom.render(<h1>Todos App</h1>, document.getElementById('root'))
})
