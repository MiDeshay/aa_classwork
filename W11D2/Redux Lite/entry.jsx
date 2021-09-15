// import React from "react";
// import ReactDom from 'react-dom';
import Store from './store/store'

document.addEventListener("DOMContentLoaded", ()=>{
    //ReactDom.render(<h1>Redux Lite</h1>, document.getElementById('root'))
    window.store = new Store(reducer);
})
