import React from "react";
import Clock from "./clock";
import Tabs from "./tabs";

function App() {

  const tabs=[
    {title: "tab1", content: "content1"},
    {title: "tab2", content: "content2"},
    {title: "tab3", content: "content3"},
    {title: "tab4", content: "content4"}
  ]

  return (
    <>
    <Clock />
    <Tabs array={tabs} />
    
    </>
  )
}

export default App;