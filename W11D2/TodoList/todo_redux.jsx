import React from "react";
import ReactDom from 'react-dom';
import Root from './frontend/components/root'
import configureStore from './frontend/store/store'; 
import { allTodos } from "./frontend/reducers/selectors";


const preloadedState = {
    todos:{ 
        1: {
            id: 1,
            title: 'wash car',
            body: 'with soap',
            done: false
          },
          2: {
            id: 2,
            title: 'wash dog',
            body: 'with shampoo',
            done: true
          },
    }
}


document.addEventListener("DOMContentLoaded", ()=>{
    const store = configureStore(preloadedState)
    
    //Debug
    window.store = store;
    window.allTodos = allTodos;

    ReactDom.render(<Root store = {store}/> , document.getElementById('root'))
})
