import React from "react";
import ReactDOM from "react-dom";
import { signUpUser, loginUser } from "./actions/session_actions";
import Root from "./components/root"
import {configureStore} from "./store/store"




document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore()

  
  window.getState = store.getState
  window.dispatch = store.dispatch
  window.signUpUser = signUpUser
  window.loginUser = loginUser
  
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store}/>, root);
});