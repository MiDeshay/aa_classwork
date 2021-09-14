import React from "react";
import ReactDom from 'react-dom';
import configureStore from './frontend/store/store'

document.addEventListener("DOMContentLoaded", ()=>{
    const store = configureStore();
    window.store = store; 
    ReactDom.render(<h1>Todos App</h1>, document.getElementById('root'))
})
