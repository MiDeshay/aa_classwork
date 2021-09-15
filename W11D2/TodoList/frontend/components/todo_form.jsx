import React from "react";

export default class TodoForm extends React.Component{
    constructor(props){
        super(props)

        this.state = {
            id: Date().getTime(),
            title: "",
            body: "",
            done: false
        }
    }


    render(){
        return(
            <form onSubmit= {this.handleSubmit}>
                <h1>Add a Task</h1>
                <label>Title:
                    <input type="text" value={this.state.title} onChange={this.updateTitle}/>
                </label>

                <label>Body:
                    <input type="text" value={this.state.body} onChange={this.updateBody}/>
                </label>

                <label>Completed:
                    <label>True
                        <input type="radio" value={true} name="done" onChange={this.updateDone}/>
                    </label>

                    <label>False
                        <input type="radio" value={false} name="done" onChange={this.updateDone}/>
                    </label>
                </label>

                <input type="submit" value="Add Task"/>

            </form>
        )
    }
       


}