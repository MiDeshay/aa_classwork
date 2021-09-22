import React from "react";
import ReactDOM from "react-dom";
import { login, logout, signUp } from "./util/session_api_util";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  window.signUp = signUp;
  window.login = login;
  window.logout = logout;
  
  ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});