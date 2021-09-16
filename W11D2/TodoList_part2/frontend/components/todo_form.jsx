import React from "react";

export default class TodoForm extends React.Component{
    constructor(props){
        super(props)

        this.state = {
            id: "",
            title: "",
            body: "",
            done: false
        }
        this.updateBody = this.updateBody.bind(this);
        this.updateTitle = this.updateTitle.bind(this);
        this.updateDone = this.updateDone.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    updateTitle(e){
        this.setState({title: e.target.value})
    }

    updateBody(e){
        this.setState({body: e.target.value})
    }

    updateDone(e){
        this.setState({done: e.target.value})
    }

    handleSubmit(e){
        e.preventDefault();
        this.setState({id: new Date().getTime()})
        this.props.receiveTodo(this.state)
    }
    
    render(){
        return(
            <form onSubmit= {this.handleSubmit}>
                <h2>Add a Task</h2>
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

                <input type="submit" value="Add Task" onSubmit={this.handleSubmit}/>

            </form>
        )
    }    
}