import React from "react";
import ReactDom from 'react-dom';
import Root from './frontend/components/root'
import configureStore from './frontend/store/store'; 



document.addEventListener("DOMContentLoaded", ()=>{
    const store = configureStore()

    ReactDom.render(<Root store = {store}/> , document.getElementById('root'))
})
